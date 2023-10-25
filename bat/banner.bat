rem Copyright (c) 2023 David H Isakson II
rem 
rem This software is released under the MIT License.
rem https://opensource.org/licenses/MIT

@echo off
cls

:: Colors
set rd_bd=^<NUL ^&^ e^^(^"^[1;31m^"^)
set gn_bd=^<NUL ^&^ e^^(^"^[1;32m^"^)
set reset=^<NUL ^&^ e^^(^"^[0m^"^)

:: Banner
echo.
echo %rd_bd%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%^reset%
echo %rd_bd#                                                            #%^reset%
echo %rd_bd#   #####  #    #  #    #  #    #  #####   ######  #####     #%^reset%
echo %rd_bd#     #    #    #  #    #  ##   #  #    #  #       #    #    #%^reset%
echo %rd_bd#     #    ######  #    #  # #  #  #    #  #####   #    #    #%^reset%
echo %rd_bd#     #    #    #  #    #  #  # #  #    #  #       #####     #%^reset%
echo %rd_bd#     #    #    #  #    #  #   ##  #    #  #       #   #     #%^reset%
echo %rd_bd#     #    #    #   ####   #    #  #####   ######  #    #    #%^reset%
echo %rd_bd#                                                            #%^reset%
echo %rd_bd#   ####    ####   #####      #    #####    #####   ####     #%^reset%
echo %rd_bd#  #       #    #  #    #     #    #    #     #    #         #%^reset%
echo %rd_bd#   ####   #       #    #     #    #    #     #     ####     #%^reset%
echo %rd_bd#       #  #       #####      #    #####      #         #    #%^reset%
echo %rd_bd#  #    #  #    #  #   #      #    #          #    #    #    #%^reset%
echo %rd_bd#   ####    ####   #    #     #    #          #     ####     #%^reset%
echo %rd_bd#                                                            #%^reset%
echo %rd_bd%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%^reset%
echo.
echo %gn_bdBy: phA7hax0r3R %reset%
timeout /t 4 >nul
