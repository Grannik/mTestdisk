#!/bin/bash
 E='echo -e';
 e='echo -en';
#
 i=0; CLEAR; CIVIS;NULL=/dev/null
 trap "R;exit" 2
 ESC=$( $e "\e")
 TPUT(){ $e "\e[${1};${2}H" ;}
 CLEAR(){ $e "\ec";}
 CIVIS(){ $e "\e[?25l";}
 R(){ CLEAR ;stty sane;CLEAR;};                 # в этом варианте фон прозрачный
#
 ARROW(){ IFS= read -s -n1 key 2>/dev/null >&2
           if [[ $key = $ESC ]];then
              read -s -n1 key 2>/dev/null >&2;
              if [[ $key = \[ ]]; then
                 read -s -n1 key 2>/dev/null >&2;
                 if [[ $key = A ]]; then echo up;fi
                 if [[ $key = B ]];then echo dn;fi
              fi
           fi
           if [[ "$key" == "$($e \\x0A)" ]];then echo enter;fi;}
 UNMARK(){ $e "\e[0m";}
 MARK(){ $e "\e[30;47m";}
#
 HEAD()
{
 for (( a=2; a<=38; a++ ))
          do
              TPUT $a 1;$E "\e[47;30m│\e[0m                                                                                \e[47;30m│\e[0m"
          done
 TPUT  1 1;$E "\033[0m\033[47;30m┌────────────────────────────────────────────────────────────────────────────────┐\033[0m"
 TPUT  3 3;$E "\e[1;36m *** testdisk ***\e[0m";
 TPUT  4 3;$E "\e[2m Scan and repair disk partitions\e[0m";
 TPUT  5 1;$E "\e[47;30m├\e[0m\e[1;30m────────────────────────────────────────────────────────────────────────────────\e[0m\e[47;30m┤\e[0m"
 TPUT  9 1;$E "\e[47;30m├\e[0m\e[1;30m────────────────────────────────────────────────────────────────────────────────\e[0m\e[47;30m┤\e[0m"
 TPUT 10 3;$E "\e[36m OPTIONS\e[0m                                                              \e[2m Опции\e[0m";
 TPUT 15 1;$E "\e[47;30m├\e[0m\e[1;30m────────────────────────────────────────────────────────────────────────────────\e[0m\e[47;30m┤\e[0m"
 TPUT 18 1;$E "\e[47;30m├\e[0m\e[1;30m────────────────────────────────────────────────────────────────────────────────\e[0m\e[47;30m┤\e[0m"
 TPUT 19 3;$E "\e[36m Operating procedure\e[0m                                         \e[2m Порядок работы\e[0m";
 TPUT 34 1;$E "\e[47;30m├\e[0m\e[1;30m────────────────────────────────────────────────────────────────────────────────\e[0m\e[47;30m┤\e[0m"
 TPUT 36 1;$E "\e[47;30m├\e[0m\e[2m─ Up \xE2\x86\x91 \xE2\x86\x93 Down Select Enter ─────────────────────────────────────────────────────\e[0m\e[47;30m┤\e[0m"
 TPUT 39 1;$E "\033[0m\033[47;30m└────────────────────────────────────────────────────────────────────────────────┘\033[0m"
}
  M0(){ TPUT  6 3; $e " Установка                                                          \e[32m INSTALL \e[0m";}
  M1(){ TPUT  7 3; $e " Kраткий обзор                                                     \e[32m SYNOPSIS \e[0m";}
  M2(){ TPUT  8 3; $e " Описание                                                       \e[32m DESCRIPTION \e[0m";}
  M3(){ TPUT 11 3; $e " Create a testdisk.log file                                          \e[32m /log   \e[0m";}
  M4(){ TPUT 12 3; $e " Add debug information                                               \e[32m /debug \e[0m";}
  M5(){ TPUT 13 3; $e " Dump raw sectors                                                    \e[32m /dump  \e[0m";}
  M6(){ TPUT 14 3; $e " Display current partitions                                          \e[32m /list  \e[0m";}
  M7(){ TPUT 16 3; $e "                                                                   \e[32m SEE ALSO \e[0m";}
  M8(){ TPUT 17 3; $e "                                                                     \e[32m AUTHOR \e[0m";}
  M9(){ TPUT 20 3; $e " Создание лог-файла                                                \e[32m [Step 1] \e[0m";}
 M10(){ TPUT 21 3; $e " Ввести пароль                                                     \e[32m [Step 2] \e[0m";}
 M11(){ TPUT 22 3; $e " Выбрать диск для сканирования                                     \e[32m [Step 3] \e[0m";}
 M12(){ TPUT 23 3; $e " Выбрать тип разметки                                              \e[32m [Step 4] \e[0m";}
 M13(){ TPUT 24 3; $e " Выбрать действие                                                  \e[32m [Step 5] \e[0m";}
 M14(){ TPUT 25 3; $e " Выбрать тип действия                                              \e[32m [Step 6] \e[0m";}
 M15(){ TPUT 26 3; $e " Подтвердить                                                       \e[32m [Step 7] \e[0m";}
 M16(){ TPUT 27 3; $e " Выбрать тип действия                                              \e[32m [Step 8] \e[0m";}
 M17(){ TPUT 28 3; $e " Процесс завершон                                                  \e[32m [Step 9] \e[0m";}
 M18(){ TPUT 29 3; $e " Выйти обратно                                                     \e[32m [Step10] \e[0m";}
 M19(){ TPUT 30 3; $e " Выбрать расширенные настройки                                     \e[32m [Step11] \e[0m";}
 M20(){ TPUT 31 3; $e " Выбрать удаленное                                                 \e[32m [Step12] \e[0m";}
 M21(){ TPUT 32 3; $e " Просмотреть результат и выйти                                     \e[32m [Step13] \e[0m";}
 M22(){ TPUT 33 3; $e " Выйти из программы                                                \e[32m [Step14] \e[0m";}
 M23(){ TPUT 35 3; $e " Grannik                                                                \e[32m Git \e[0m";}
 M24(){ TPUT 37 3; $e "                                                                       \e[32m Exit \e[0m";}
LM=24
   MENU(){ for each in $(seq 0 $LM);do M${each};done;}
    POS(){ if [[ $cur == up ]];then ((i--));fi
           if [[ $cur == dn ]];then ((i++));fi
           if [[ $i -lt 0   ]];then i=$LM;fi
           if [[ $i -gt $LM ]];then i=0;fi;}
REFRESH(){ after=$((i+1)); before=$((i-1))
           if [[ $before -lt 0  ]];then before=$LM;fi
           if [[ $after -gt $LM ]];then after=0;fi
           if [[ $j -lt $i      ]];then UNMARK;M$before;else UNMARK;M$after;fi
           if [[ $after -eq 0 ]] || [ $before -eq $LM ];then
           UNMARK; M$before; M$after;fi;j=$i;UNMARK;M$before;M$after;}
   INIT(){ R;HEAD;MENU;}
     SC(){ REFRESH;MARK;$S;$b;cur=`ARROW`;}
# Функция возвращения в меню
     ES(){ MARK;$e " ENTER = main menu ";$b;read;INIT;};INIT
  while [[ "$O" != " " ]]; do case $i in
  0) S=M0;SC; if [[ $cur == enter ]];then R;echo -e "
 Debian/Ubuntu:\e[32m
 sudo apt-get update
 sudo apt-get install testdisk
\e[0m
 Arduino\e[32m
 sudo apt-get install testdisk
\e[0m
 Red Hat/Fedora:\e[32m
 sudo dnf install testdisk
\e[0m
 Arch Linux:
 Выполните следующую команду для установки TestDisk из AUR (Arch User Repository),
 если вы используете yay:\e[32m
 yay -S testdisk\e[0m

 Если у вас нет yay, установите его сначала:\e[32m
 sudo pacman -S yay
\e[0m";ES;fi;;
  1) S=M1;SC; if [[ $cur == enter ]];then R;echo -e "\e[32m
 testdisk [/log] [/debug] [/dump] [device|image.dd|image.e01]

 testdisk /version

 testdisk /list [/log]
\e[0m";ES;fi;;
  2) S=M2;SC; if [[ $cur == enter ]];then R;echo -e "
 TestDisk проверяет и восстанавливает потерянные разделы. Работает с:

 -\e[32m BeFS (BeOS) BeFS, или Be File System\e[0m, является файловой системой,
   разработанной для операционной системы BeOS
 -\e[32m BSD disklabel (FreeBSD/OpenBSD/NetBSD) BSD disklabel\e[0m, известный также как
   'диск-метка BSD' или просто 'disklabel', это концепция, используемая в
   операционных системах семейства BSD (таких как FreeBSD, OpenBSD и NetBSD) для
   организации и маркировки разделов на жестком диске или других устройствах
   хранения данных.
 -\e[32m CramFS, Compressed File System CramFS (Compressed ROM File System)\e[0m
   это файловая система сжатия, разработанная для использования в устройствах с
   ограниченными ресурсами, таких как встроенные системы, встраиваемые устройства и
   носимая электроника. CramFS позволяет сжимать файлы и хранить их на диске или
   флэш-памяти, что позволяет экономить место на носителе данных.
 -\e[32m DOS/Windows FAT12, FAT16 and FAT32\e[0m
 -\e[32m HFS and HFS+, Hierarchical File System\e[0m файловые системы, разработанные
   и использовавшиеся в операционных системах Apple для управления файлами
   и данными на жестких дисках и других носителях.
 -\e[32m JFS, IBM's Journaled File System\e[0m
 -\e[32m Linux ext2/ext3/ext4\e[0m
   Linux RAID (Redundant Array of Independent Disks) представляет собой
   технологию, которая позволяет объединить несколько физических жестких дисков
   в одну логическую единицу хранения данных с целью увеличения производительности,
   отказоустойчивости или обоих. В Linux RAID существует несколько уровней
   (или уровней RAID), включая RAID 1, RAID 4, RAID 5 и RAID 6.
\e[32m RAID 1\e[0m зеркальное отображение
\e[32m RAID 4\e[0m полосатый массив с устройством контроля четности
\e[32m RAID 5\e[0m полосатый массив с распределенной информацией о четности
\e[32m RAID 6\e[0m полосатый массив с распределенной информацией с двойным резервированием
 -\e[32m Linux Swap (versions 1 and 2)\e[0m область на жестком диске или другом устройстве
 хранения данных, используемая операционной системой Linux для виртуальной памяти
 -\e[32m LVM and LVM2, Linux Logical Volume Manager\e[0m это технологии управления логическими
   томами и разделами в операционной системе Linux. Они предоставляют механизмы для
   управления хранилищем данных на более высоком уровне абстракции и облегчают
   управление пространством хранения, распределение ресурсов дискового пространства.
 -\e[32m Mac partition map известная как Apple Partition Map (APM)\e[0m это структура
   разделения диска, используемая в более старых версиях операционной системы macOS.
 -\e[32m Novell Storage Services NSS\e[0m файловая система и технология управления данными,
   разработанная компанией Novell.
 -\e[32m NTFS (Windows NT/2K/XP/2003/Vista/...)\e[0m
 -\e[32m ReiserFS 3.5, 3.6 and 4\e[0m это семейство файловых систем, разработанных
   Хансом Рейзером и его командой. Эти файловые системы были предназначены для
   операционных систем Linux и других Unix-подобных систем.
 -\e[32m Sun Solaris i386 disklabel\e[0m это формат разделения диска,
   используемый в операционной системе Solaris
 -\e[32m Unix File System UFS and UFS2 (Sun/BSD/...)\e[0m это файловые системы,
   которые используются в различных операционных системах семейства Unix
 -\e[32m XFS, SGI's Journaled File System\e[0m это высокопроизводительная журналированная
   файловая система, разработанная корпорацией Silicon Graphics, Inc. (SGI).

 Он может восстановить файлы из:\e[2m
 - DOS/Windows FAT12, FAT16 and FAT32
 - Linux ext2
 - NTFS (Windows NT/2K/XP/2003/Vista/...)
\e[0m
 For more information on how to use, please visit the wiki pages on:\e[36m
 www.cgsecurity.org
\e[0m";ES;fi;;
  3) S=M3;SC; if [[ $cur == enter ]];then R;echo -e "\e[32m \e[0m";ES;fi;;
  4) S=M4;SC; if [[ $cur == enter ]];then R;echo -e "\e[32m \e[0m";ES;fi;;
  5) S=M5;SC; if [[ $cur == enter ]];then R;echo -e "\e[32m \e[0m";ES;fi;;
  6) S=M6;SC; if [[ $cur == enter ]];then R;echo -e "\e[32m \e[0m";ES;fi;;
  7) S=M7;SC; if [[ $cur == enter ]];then R;echo -e "\e[32m
 fdisk
 photorec
\e[0m";ES;fi;;
  8) S=M8;SC; if [[ $cur == enter ]];then R;echo -e "
 TestDisk 7.1, Data Recovery Utility, July 2019. Christophe GRENIER:
\e[36m grenier@cgsecurity.org
 https://www.cgsecurity.org
\e[0m";ES;fi;;
  9) S=M9;SC; if [[ $cur == enter ]];then R;echo -e "
 TestDisk 7.1, Data Recovery Utility, July 2019
 Christophe GRENIER <grenier@cgsecurity.org>
 https://www.cgsecurity.org

 TestDisk — это бесплатное программное обеспечение для восстановления данных,
 предназначенное для восстановления потерянных данных. разделы и/или снова сделать
 незагружающиеся диски загрузочными при появлении этих симптомов. вызваны
 неисправным программным обеспечением, определенными типами вирусов или
 человеческой ошибкой. Его также можно использовать для исправления некоторых
 ошибок файловой системы.

 Информацию, собранную во время использования TestDisk, можно записать для
 последующего использования обзор. Если вы решите создать текстовый файл
 testdisk.log, он будет содержать опции TestDisk, техническую информацию и
 различные выходы; включая любые имена папок/файлов. TestDisk использовался для
 поиска и список на экране.
\e[2m
 Use arrow keys to select, then press Enter key:
 Используйте клавиши со стрелками для выбора, затем нажмите клавишу Enter:
\e[31m>[ Create ]\e[0m\e[2m Create a new log file          | Создать новый файл журнала
 [ Append ] Append information to log file | Добавить информацию в файл журнала
 [ No Log ] Don't record anything          | Ничего не записывай
\e[0m
";ES;fi;;
 10) S=M10;SC;if [[ $cur == enter ]];then R;echo -e "\e[2m
 Диск не найден. TestDisk попытается перезагрузиться с помощью команды sudo, чтобы
 получить права root (суперпользователя) sudo может запросить ваш пароль
 пользователя, но не запрашивает пароль root.
 Обычно при вводе пароля не отображается эхо или символ «*».\e[0m
\e[31m [sudo] password for user:\e[0m
";ES;fi;;
 11) S=M11;SC;if [[ $cur == enter ]];then R;echo -e "\e[2m
 Выберите носитель (используйте клавиши со стрелками, затем нажмите Enter):\e[0m
\e[31m>Disk /dev/sda - 200 GB / 250 GiB - WEF WN7010MYDU-10WNATO\e[0m
\e[2m Disk /dev/sdb - 100 GB / 250 GiB - MAYBAH External USB 3.0
 Disk /dev/loop0 - 64 MB / 61 MiB (RO)
 Disk /dev/loop1 - 4096 B (RO)
 Disk /dev/loop2 - 77 MB / 73 MiB (RO)
 Disk /dev/loop3 - 171 MB / 163 MiB (RO)
 Disk /dev/loop4 - 77 MB / 73 MiB (RO)
 Disk /dev/loop5 - 248 MB / 236 MiB (RO)
\e[0m
\e[31m>[Proceed ]\e[0m\e[2m[  Quit  ]\e[0m
 Примечание. Для успешного восстановления емкость диска должна быть правильно
 определена. Если указанный выше диск имеет неправильный размер, проверьте
 настройки перемычки HD и обнаружение BIOS, а также установите последние
 исправления ОС и драйверы дисков.
";ES;fi;;
 12) S=M12;SC;if [[ $cur == enter ]];then R;echo -e "
\e[31m>Disk /dev/sda - 200 GB / 250 GiB - WEF WN7010MYDU-10WNATO\e[0m
\e[2mPlease select the partition table type, press Enter when done.\e[0m
\e[31m>[Intel  ] Intel/PC partition\e[0m\e[2m
 [EFI GPT] EFI GPT partition map (Mac i386, some x86_64...)
 [Humax  ] Humax partition table
 [Mac    ] Apple partition map (legacy)
 [None   ] Non partitioned media
 [Sun    ] Sun Solaris partition
 [XBox   ] XBox partition
 [Return ] Return to disk selection
\e[0m
 Подсказка: обнаружен тип таблицы разделов Intel. Примечание. НЕ выбирайте «Нет»
 для носителя только с одним разделом. Очень редко диск бывает «неразбитым».
";ES;fi;;
 13) S=M13;SC;if [[ $cur == enter ]];then R;echo -e "\e[2m
 Disk /dev/sda - 200 GB / 250 GiB - WEF WN7010MYDU-10WNATO
     CHS 60801 255 63 - sector size=512\e[0m

\e[31m>[ Analyse  ]\e[0m\e[2m Analyse current partition structure and search for lost partitions
 [ Advanced ] Filesystem Utils
 [ Geometry ] Change disk geometry
 [ Options  ] Modify options
 [ MBR Code ] Write TestDisk MBR code to first sector
 [ Delete   ] Delete all data in the partition table
 [ Quit     ] Return to disk selection
\e[0m
 Примечание. Для успешного восстановления необходима правильная геометрия диска.
 Процесс «Анализ» может выдать несколько предупреждений,
 если считает, что логическая геометрия не соответствует.
";ES;fi;;
 14) S=M14;SC;if [[ $cur == enter ]];then R;echo -e "\e[2m
 Disk /dev/sda - 400 GB / 365 GiB - DFH 36102 322 36
 Current partition structure:
     Partition                  Start        End    Size in sectors

 1 * HPFS - NTFS              1  22 35 60801  60 12  850429638 [WEF W0MYDU-NATO]

 *=Primary bootable     P=Primary  L=Logical    E=Extended    D=Deleted
 *=Основной загрузочный P=Основной L=Логический E=Расширенный D=Удалено
\e[31m>[Quick Search]\e[0m\e[2m  [ Backup ]
 Попробуйте найти раздел
\e[0m";ES;fi;;
 15) S=M15;SC;if [[ $cur == enter ]];then R;echo -e "\e[2m
 Disk /dev/sda - 125 GB / 150 GiB - TRN 00023 324 87
     Partition               Start        End    Size in sectors\e[0m
\e[31m> * HPFS - NTFS              1  22 35 60801  60 12  850429638 [WEF W0MYDU-NATO]\e[0m
\e[2m
 Структура: Ок. Используйте клавиши со стрелками вверх/вниз для выбора раздела.
 Используйте клавиши стрелками влево/вправо, чтобы ИЗМЕНИТЬ характеристики раздела:
 *=Primary bootable     P=Primary  L=Logical    E=Extended    D=Deleted
 *=Основной загрузочный P=Основной L=Логический E=Расширенный D=Удалено
 A: add partition,  L: load backup,              T: change type, P: list files,
 A: добавить раздел L: загрузить резервную копию T: изменить тип P: глянуть файлы
     Enter: to continue
NTFS, blocksize=1096, 120 GB / 150 GiB
\e[0m";ES;fi;;
 16) S=M16;SC;if [[ $cur == enter ]];then R;echo -e "
\e[2m
 Disk /dev/sda - 100 GB / 205 GiB - VYS 47980 112 32

     Partition                  Start        End    Size in sectors

 1 * HPFS - NTFS              1  22 35 50501  60 12  850429638 [WEF W0MYDU-NATO]

 [  Quit  ]  [ Return ]\e[0m\e[31m >[Deeper Search]\e[0m\e[2m  [ Write  ]
                          Попробуйте найти больше разделов
\e[0m";ES;fi;;
 17) S=M17;SC;if [[ $cur == enter ]];then R;echo -e "\e[2m
 Disk /dev/sda - 100 GB / 205 GiB - VYS 47980 112 32

     Partition               Start        End    Size in sectors\e[0m
\e[32m> * HPFS - NTFS              1  22 35 50501  60 12  850429638 [WEF W0MYDU-NATO]
\e[0m\e[2m
 Структура: Ок. Используйте клавиши со стрелками вверх/вниз для выбора раздела.
 Используйте клавиши стрелками влево/вправо, чтобы ИЗМЕНИТЬ характеристики раздела:
 *=Primary bootable     P=Primary  L=Logical    E=Extended    D=Deleted
 *=Основной загрузочный P=Основной L=Логический E=Расширенный D=Удалено
 A: add partition,  L: load backup,              T: change type, P: list files,
 A: добавить раздел L: загрузить резервную копию T: изменить тип P: глянуть файлы
     Enter: to continue
 NTFS, blocksize=1096, 120 GB / 150 GiB
\e[0m";ES;fi;;
 18) S=M18;SC;if [[ $cur == enter ]];then R;echo -e "\e[2m
 Disk /dev/sda - 100 GB / 205 GiB - VYS 47980 112 32

     Partition                  Start        End    Size in sectors

 1 * HPFS - NTFS              1  22 35 50501  60 12  850429638 [WEF W0MYDU-NATO]

\e[0m\e[31m>[  Quit  ]\e[0m\e[2m  [ Return ]  [ Write  ]
                              Return to main menu
\e[0m";ES;fi;;
 19) S=M19;SC;if [[ $cur == enter ]];then R;echo -e "\e[2m
 Disk /dev/sda - 200 GB / 250 GiB - WEF WN7010MYDU-10WNATO
     CHS 60801 255 63 - sector size=512\e[0m

 [ Analyse  ] Analyse current partition structure and search for lost partitions
\e[31m>[ Advanced ]\e[0m\e[2m Filesystem Utils
 [ Geometry ] Change disk geometry
 [ Options  ] Modify options
 [ MBR Code ] Write TestDisk MBR code to first sector
 [ Delete   ] Delete all data in the partition table
 [ Quit     ] Return to disk selection
\e[0m
 Примечание. Для успешного восстановления необходима правильная геометрия диска.
 Процесс «Анализ» может выдать несколько предупреждений,
 если считает, что логическая геометрия не соответствует.
";ES;fi;;
 20) S=M20;SC;if [[ $cur == enter ]];then R;echo -e "\e[2m
 Disk /dev/sda - 100 GB / 205 GiB - VYS 47980 112 32

     Partition                  Start        End    Size in sectors
\e[0m
\e[32m> 1 * HPFS - NTFS              1  22 35 50501  60 12  850429638 [WEF W0MYDU-NATO]
\e[0m\e[2m
 [  Type  ]  [  Boot  ]  [  List  ]\e[0m\e[31m >[Undelete]\e[0m\e[2m  [Image Creation]  [  Quit  ]
                                 File undelete
\e[0m";ES;fi;;
 21) S=M21;SC;if [[ $cur == enter ]];then R;echo -e "\e[2m
 1 * HPFS - NTFS              1  22 35 50501  60 12  850429638 [WEF W0MYDU-NATO]
Deleted files

>.config                                                7-Oct-2017 23:18         276
 какойтоДокумент.pdf                                    7-Oct-2017 23:18         154
 text.txt                                               7-Oct-2017 23:18         276
 .                                                      7-Oct-2017 23:18         154
 ..                                                     7-Oct-2022 23:18         276
 edit.mp3                                               7-Oct-2022 23:18         276


 Используйте : для выбора текущего файла, a для выбора/отмены выбора всех файлов,
 C to copy the selected files,         c to copy the current file,        q to quit
 C, чтобы скопировать выбранные файлы, c, чтобы скопировать текущий файл, q выйти
                                                   Next
\e[0m";ES;fi;;
 22) S=M22;SC;if [[ $cur == enter ]];then R;echo -e "\e[2m
 [  Type  ]  [  Boot  ]  [  List  ] >[Undelete]\e[0m\e[2m  [Image Creation]\e[0m\e[31m >[  Quit  ]\e[0m
\e[2m                                 File undelete
\e[0m
 === Далее ========================================================================
\e[2m
 [ Analyse  ] Analyse current partition structure and search for lost partitions
 [ Advanced ] Filesystem Utils
 [ Geometry ] Change disk geometry
 [ Options  ] Modify options
 [ MBR Code ] Write TestDisk MBR code to first sector
 [ Delete   ] Delete all data in the partition table\e[0m
\e[31m>[ Quit     ]\e[0m\e[2m Return to disk selection\e[0m

 === Далее ========================================================================

\e[2m [Proceed ]\e[0m\e[31m >[  Quit  ]\e[0m
";ES;fi;;
 23) S=M23;SC;if [[ $cur == enter ]];then R;echo -e "
 Di 12 Jul 2022 16:42:14 CEST
 Описание утилиты testdisk. Scan and repair disk partitions.
 Asciinema:  \e[36m https://asciinema.org/a/607934\e[0m
 Github:     \e[36m \e[0m
 Gitlab:     \e[36m \e[0m
 Sourceforge:\e[36m \e[0m
 Notabug:    \e[36m \e[0m
 Bitbucket:  \e[36m \e[0m
 Framagit:   \e[36m \e[0m
 GFogs:      \e[36m \e[0m
 Codeberg:   \e[36m \e[0m
 Gitea       \e[36m \e[0m
";ES;fi;;
 24) S=M24;SC;if [[ $cur == enter ]];then R;clear;exit 0;fi;;
 esac;POS;done
