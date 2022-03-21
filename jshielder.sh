#!/bin/bash


# Linux Hardening Script

# A lot of Suggestion Taken from The Lynis Project
# www.cisofy.com/lynis
# Credits to Michael Boelen @mboelen

#Credits to Center for Internet Security CIS

##############################################################################################################

f_banner(){
echo
echo "
                               .8 888SS..                                                                                                                                                                                                                                                                   
  .  . .  .  . .  .  . .  . :@%@8@8888X@8S: . .  . .  . .  . .  . .  . .  . .  . .  . .  . .  . .  . .  . .  . .  . .  . .  . .  . .  . .  . .  . .  . .  . .  . .  . .  . .  . .  . .  . .  . .  . .  . .  . .  . .  . .  . .  . .  . .  . .  . .  . .  . .  . .  . .  . .  . .  . .  . .  . .  . .  . .  .
   .       .       .    .t8 88888888@88@X@8S8t .     .         .         .         .         .         .         .         .         .         .         .         .         .         .         .         .         .         .         .         .         .         .         .         .         .      
     .  .    .  .    . %:8888888@8@888888@8@8@%% .      . .  .    . .  .    . .  .    . .  .    . .  .    . .  .    . .  .    . .  .    . .  .    . .  .    . .  .    . .  .    . .  .    . .  .    . .  .    . .  .    . .  .    . .  .    . .  .    . .  .    . .  .    . .  .    . .  .    . .  .    . . 
 .       .       . .SSt8888888888 88XS8888@88.88@%%. .      .   .         .         .         .         .         .         .         .         .         .         .     .tX8%;%       .         .         .         ..%88XXXXX.         .         .         .         .         .         .         :%@8t;
   .  .    .  . :8 8888888888X 8X;t: .::8888888@8:8@X. .  .        . .  .    . .  .    . .  .    . .  .    . .  .    . .  .    . .  .    . .  .    . .  .    . .  .    .  t@8888%  .  .    . .  .    . .  .    . .  t. :8888888@   . .  .    . .  .    . .  .    . .  .    . .  .    . .  .    . .  .:S88888
  .    .  .   :%88@8@888888%8t:.         %8X8@8:X888@8.      . . .     .   .     .   .     .   .     .   .     .   .     .   .     .   .     .   .     .   .     .   .   .S88888t   .    .     .   .     .   .     % @888888888:  .    .   .     .   .     .   .     .   .     .   .     .   .     . : 88888
    .      t8 @8@@888@88S:8;. ..  .  .    :;888@8@;888S. .          .    .    .    .    .    .    .    .    .    .    .    .    .    .    .    .    .    .    .    .   .  S88888% .    .    .    .    .    .    . ;888888X  XS@@     .   .    .    .    .    .    .    .    .    .    .    .    .    : 88888
  .   ..XtS8t8888888@ 88.   .   .   .      ..% 8@8888X@.   .  .  .    .    .    .    .    .    .    .    .    .    .    .    .    .    .    .    .    .    .    .    .    S88888%    .   .    .    .    .    .    :88888SS      .  .        .   .    .    .    .    .    .    .    .    .    .    .  : 88888
    . 8 :@88X888888.t;;. .    . . .          .:S8888888        .   .    .    .    .    .    .    .    .    .    .    .    .    .    .    .    .    .    .    .    .     . S88888S .    .   .    .    .    .    .  X88888;             . .  .      .    .    .    .    .    .    .    .    .    .    .. 88888
  :@;@8888888888 8X.      .      .t%%::       .X88888S8 .  .    :8%S%S%SS%S%SX8@;.  .    .    .:@S tXXSSt.XS..    .    . :@S tSXXX%:;8% .  .   tX%SS%S%SS%SSX8X;    .     X88888%   .    :XX tSXSSt XX:     .:@S%S @8888tSSSS%SS .%S%SSS%    . .  %%S%SS%   X%S%SS%S%SS%SX8S; .   .    .   .t@8XS%S%St 88888
.X@888888@88S:X;::   . .    . :S8X.;t88..    . S8888888.     .  8X88888888888888X @8.  .   . 88t888888888888.SS .   . .88t8888888888888  t   . :888888888888888S ;@   . . S88888% .   .@@:888888888888:8@ .  888888888888888888X  t88888; .      .;88888t ..@888888888888888S :S    .   :X8.@888888888888888
.888 @8 S 8@    .  .     ..;@8 ;t8;8::8 ..     X8:@8.X@  .  .   8X888888888888888888 @   . :%88@888@S%@8888888%      ;@88@888@S%X@@888888;%    :88888888888888888888%     S88888S   ..:X88888@SSt8888888X .  @@8888888888888888@  %88888;   .  .  ;88888;   @888888888888888888X..    .8 8888888888888888888
88@8@8@8S..:  .      .  .tX 8;8XX.8 8 @;       @@888888   .    .8X8888 ;t;;t:S 888888 ;    %88888@@8%%%S% 8888@t8. . .88888@88t%%;S; 88888.%.  :888888t;;t;.@:8888888.  . X88888%    @@8888@88tt%%X @8888S8  tt;;; 8888@%;;;t;;8. t88888t     .   ;88888;  .@88888;t;;;;;t 88888X8. . X:888888 ;:t;;;::88888
8.X8888%  ..    . .  .t88 @.@ @ 88.%8: . .     S8:88.XS.     .  8@8888@       :S 88888..  : 8888@:.      ;888888%   t 8888Xt.       t@88888:  ..88888;     ..%.S8888@8.   S88888% . .888888:.       S888888.      @88888@   .     %88888t . .    .;88888t . @8888X8.    . :;888888.  .X88888 8.      ; 88888
88 8 88%   . .   .:S8X 8:8 8 8S%8:8@%8X.       X@888888. .     .8X8888@.  .  .  8%8888 :. X;@888    .     Xt@888 :  @888888.     .  .8@8888S.  :88888:  .      :888888.  .S88888%   S:8888 ;        %:8888.% .    888888@     . . %88888;      .  ;88888t  .@8888X8.  .    t 8888.%. S;8888.S   . .  : 88888
88888 t  .  .  .:8 .;8.88.888X8 % @S.@8        S888888: .  .   .8X8888X    .   .; 8888t8  8@8888@ttt;tttt;8t8888.; .S88888S   .     .St@888    .88888:    .   .@S8888     X88888%.  XS8888 tttttttttS.8888;X   . .88888@@ .       t88888t  .  .   ;88888;  .X8888@8.     . : 8888%8  8@8888S. .     .: 88888
8:8 888.   .   ;8 X:8 8X:8@8@...8 .8.88t.      X88.@888.     .  8@8888@. .      . 8888XX. 8X88888SSSSSSSSSX88888 ;  S88888X     . .  @S8888 .  :88888; .    .  Xt@888     S88888%  .X@X8888SSSSSSSSSS88888tS .    88888@@   . .  .%88888t   .    .;88888;   @8888X8.  .    : 888@SS  8X88888     .   : 88888
@888.88t .   . @ 88:@.X8XX::   .SXX88 X.       S888@:S@ .  .   .8X8888@     .   .S8888@8. 8X88888888888888888888 ; .S88888X .  .     XS@888  . .88888:   .     XX8888   . S88888S . @@88888888888888888888%X    . 888888@  .      t88888; .    .  ;88888t ..@8888@8.    .  : 8888%@  8@88888   .   . : 88888
@ 888;%    .  .SXX:8:@;  .    . 8 88;88        X8@88888.  .     8X8888X.  .   . : 8888@@ .8@8888 ::..::;:.:.::.:S.  %88888S  .    .  XX8888 .  :88888;     . . XXX888     X88888%   X@X888. :.::;:.::.:.:.;:  .  .888888@     . . %88888t    .    ;88888t   X8888X8.  .    : 8888%X  8X88888     .   : 88888
X8 8888;       8.X.@. .    .   .XXX;8  .   .   :8;@8:X8 .    . .8@8888@     .   t 8888tS  8X8888S.     .       . .  S888888.    .   .@@X888    :88888: . .     X88888@.  .S88888%  .@X8888 .    .           .     88888@@ .       t88888:  .    . .88888:  .@8888X8.    .  : 8888%@  @S8888 . .      : 88888
X 8:8t:  . .   S 8 8 Xt. .   .  8 XX.8X        S888888X  .     .8X8888@. .    .:@888888 . t 8888t8.   .  .t:%%%%S   @t@888 S  .      :@8888X  ..88888;      . S 88888     S88888S . ; 8888S8  .   . ;.%%%St   . . 88888@@   . .  .%888888.   .   :@88888S  .@8888@8.  .    : 8888SS. :%88888;.  .  . : 88888
S.8X.@8;     . 8.88.88     .   :X::8X8X:: .    S8 @888%.   .    8X8888 @SXSXS:@:88888 X   . 88888;.8SttS8; 88888;  ..X88888..8St%%XX8@8888;8.  :888888SXSXS%.8t88888@; .  X88888%    %@8888;t8St%%@t @8888S.     .88888@@         ; 88888@SX%t%XSX88888X;  .X8888X8.     . : 8888S@   8:88888 S;SXSXXS 88888
:8;.:@8. .  .  SXX.8 @;.     :@ X@@8@;S. .     S888@88X .    . .8@888888888888888888%S   . .88888888@SS@8888888 ;.   ; 8888888@SSX88888888..   .88888888888888@8888 t   . S88888%    .88888888@SS@8888888 S  .    88888@@ . .  .   8t@888888SSX8888888t8    @8888X8.  .    : 8888SX .  tX8888888888888888888
;.@S888.       8..8 8X. . ;X8 t@ 88%8@8:.  .   S8 8888t.  .     8X8888888888888888tS8.     .%XS88888888888888X8X    . t@%888888888888888 t.    :88888888888888888;%% .    S88888%. .  ;tt@8888888888888X8@ .   . .888888@     .    .S @88888888888888 8   . X8888@8.   .   : 8888S@   . 8@S88888888888888888
;8X:X%@  .  .  S 8.@.S;%S8 ; 8 88Xt@S8:  .     S888@888.    .  .8X8888% XSS%SX8%.8t..  .      tSXS ;%X@XS:SSSt.   .    .tSSS .tX@@Xt 8 8.    . .88888 S @S%X@8%t8:     .  %SSS @8    . .%XSS .tX@@%. %%%     .    ;S%S 88  .    .     @ 8  ;XX@Xt 8 X   .    SSS%@X  .   . .%SSS X;       ;8.X8@%SS%S @ @S%8
t.;@.:         8.:@%@888 8.@8;8 X88S.. .   .   %888888: . .    .8@8888S                  .  .    ..:t%tt..      .            ;tt%tt.       .   :88888;      ..    .  .   .                   :tt%;;      . .    .           .     .       .;t%tt.     .      .          .    .      . .  .                  
t8X8%tX   . .  S 8 @ ;t8t8 :8:8 @%.      .     @88@8@88:     .  8X8888@   .    .     .    .   .        .    . .    . . . . .           . .   . :88888:     .    .   .      .       .  .  .       .            .   .      .    . .                 . .    . .    .  .  .    .                   .  .         
%.8:S;8:     .;X ;@:@;X.8:888@::   . .     . .88888@88X. .     .8X8888X.    .      .   .       .  .  .    .      .             . .   .     .   .88888;        .   .   . .        .   .     .  .        . .  .       .      .       .  .    . . .       .      .     .    .         .  . .  . .              
%. 8S8% . . t8.t8@X t@8;8S8.:..        . . .8.88888X8 .   . .   8@8888@  .    .  .       .  .      .    .    .  .   .  . .  .     .    .      .:88888:  . .     .         .   .    .   .    .   .    .        . .      .  .  .  .       .       . .  .    . .    .    .    . .   .        .     .  .     .  
%88;8:8:.t8 8:8SX.88X%%88;  .   .  .   .:;88.X8888@88X:.      . 8X8888@.   .    .   . .    .  . .    .    .    .      .      .  .   .    .  .  .88888:      . .    . .  .   .   .       . .   .   .    .  . .     .  .         .  . . .   .  .      .   .      .   .    .      .   . .  .    .   .    .   . 
%;8tX.SX 8.8;8t8X:@.@S;t..    .     :;8@:88X8888XX88;  . .  .  .t;XXXX;  .   .    .     .         .    .    .    . .     . .      .   .    .   @%SXXX@  .  .     .        .       .  .          .   .    .     .   .   . .  .           .      .  .   .    .  .  .   .    .  .             .   .    .   .   
88;%tX:8. SS8t8X8S .;S..   .    .:;88 8888@8XX 88t%                   .    .   .     .    .  .  .   .    .    .      .       . .    .   .    .        .       .    .  .      . .    .  .  . .     .   .     .    .         .  .  .  .     . .    .      .          .   .       . .  . .  .   .    .   .    .
t@8S8;8.;St8X%8% t@8:8      .  .:t88X888888S88.... . .  . .  .         .     .   .     .    .     .   .    .    .  .   . .       .    .   .     . . .    .  .   .      . .  .    .            .     .   .     .     . .  .      .     .       .    .  .   . .  .     .   . .       .    .       .        .  
 %S@.8;:.@@t8.:S ::8XX    .    .888888888888t    .     .       .  . .    .     .   . .   .    .         .    .       .     .  .    .        .  .       .   .      . .          .   .  . .  .   . .        . .   . .         .     .  .  .  .    .       .       . .          . .      .   . . .    . .      
  ..%8888;..  :88t@ ;8      . . 8@888.8@SS.  . .    .    . .    .     .   . .          .   .    .  . .    .    . .     .    .   .    . . .        .  .   .   . .      .  . .  .      .      .      .  . .     .      . .  .   .    .     .   .    . .      . .      .  . .  .    .  .            .     . .  
    ..;. .  .  8:St8XX          @88 8::    .      .   .      .     .    .     .  . .     .   .   .     .   .  .    . .   .    .   .        . .  .      .         .  .           . .     . .   .  .        .      .  .    .   .  .     .       .       . .      .  .   .        .      . .  .  .    .       .
  .    .      ;S. 8X.8    .  .  %88S . .  .   .  .      .  .   .     .     .    .    . .      .    .    .        .        .     .   .  .       .   .      . .  .      . .  . .      .  .           . .  .   .  .       .   .     .  .   .  .    .  .      .  .      .    . .  .   . .           .    . .    
    .     . .  888;8 S     .     ;:         .      . .    .      .     . .   .     .      . .   .    .    . .  .   .  . .   .            . .     .   .  .        . .      .    .  .       . . . .      .     .   . .          .       .   .  .   .   .  .      . .     .        .      . .  . .   .      .  
  .    .      ;8 8;8:X.  .          .  . .     .       .    .  .   .  .        .  .   .  .        .   .       .            .  .  . . . .     .     .  .    . .       .  .    .      . .           .  .    .    .     . . .  .   . .     .      .    .     . .      .  .   . .     .  .     .    .   .  .   .
     .   .  .  .8%8X88      .              . .   .  .    .               . . .      .       . . .   .   .  .    . . .  . .     .         .    . .       .      . .         .    .       . .  .  .       .   .     .        .        . .    .  .   .   .       .  .      .     .        .      .      .   .  
   .   .      .8.8t8@8;   .         . .  .     .   .  .    . .  . . .  .       . .    . .                .   .        .     .    .  .  .   .      . .     .  .     . . . .    .   .  .            . . .   .   .     .  .     . .  .      .      .      . .  .      . .     .   . . .     .  .    . .        
     .    .  ..X8.8.....                    .    .      .                .  .      .      . .  .  . . .    .   .  .      .    .             .  .      .  .     .            .   .   .  .  . . .             .   . .      .       .   .  .   .      . .        . .      .     .      . .   .    .      . . . 
Automated Hardening Script for Linux Servers
Developed By Hyunseok Jung @hyunsukgo "
echo
echo

}

##############################################################################################################

#Check if Running with root user

if [ "$USER" != "root" ]; then
      echo "Permission Denied"
      echo "Can only be run by root"
      exit
else
      clear
      f_banner
fi


menu=""
until [ "$menu" = "10" ]; do

clear
f_banner

echo
echo -e "\e[34m---------------------------------------------------------------------------------------------------------\e[00m"
echo -e "\e[93m[+]\e[00m SELECT YOUR LINUX DISTRIBUTION"
echo -e "\e[34m---------------------------------------------------------------------------------------------------------\e[00m"
echo ""
echo "1. Ubuntu Server 16.04 LTS"
echo "2. Ubuntu Server 18.04 LTS"
echo "3. Exit"
echo

read menu
case $menu in

1)
cd UbuntuServer_16.04LTS/
chmod +x jshielder.sh
./jshielder.sh
;;

2)
cd UbuntuServer_18.04LTS/
chmod +x jshielder.sh
./jshielder.sh
;;

3)
break
exit
;;

*) ;;

esac
done
