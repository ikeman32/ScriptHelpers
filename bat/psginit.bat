@echo off
REM PySimpleGUI Project Initialization Script

REM Copyright (c) 2023 David H Isakson II
REM This software is released under the MIT License.
REM https://opensource.org/licenses/MIT

setlocal enabledelayedexpansion

REM Prompt for project name
set /p "project_name=Enter project name: "
echo.

REM Prompt for author name
set /p "author_name=Enter author name: "
echo.

REM Create project directory and necessary subdirectories
mkdir "!project_name!"
cd "!project_name!" || exit
copy NUL LICENSE
mkdir src documentation
echo.

:license_menu
REM Prompt for license selection using a menu
echo "Select a license:"
echo "a: MIT License"
echo "b: Apache-2.0 License"
echo "c: GPL-2.0 License"
echo "d: GPL-3.0-only License"
echo "e: MPL-2.0 License"
echo "f: BSD-2-Clause License"
echo "g: BSD-3-Clause License"
echo "q: Quit"
set /p "license_choice=Your choice: "

REM Process the license choice
if /i "!license_choice!"=="a" (
    set "license_text=MIT License"
    (
        echo Copyright %date:~10,4% %author_name%
        echo.
        echo Permission is hereby granted, free of charge, to any person obtaining a copy
        echo of this software and associated documentation files (the 'Software'), to deal
        echo in the Software without restriction, including without limitation the rights
        echo to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
        echo the Software, and to permit persons to whom the Software is furnished to do so,
        echo subject to the following conditions:
        echo.
        echo The above copyright notice and this permission notice shall be included in all
        echo copies or substantial portions of the Software.
        echo.
        echo THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED,
        echo INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A
        echo PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
        echo HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
        echo OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
        echo SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
    ) >>LICENSE
) else if /i "!license_choice!"=="b" (
    set "license_text=Apache-2.0 License"
    (
        echo Copyright %date:~10,4% %author_name%
        echo.
        echo Licensed under the Apache License, Version 2.0 (the 'License');
        echo you may not use this file except in compliance with the License.
        echo You may obtain a copy of the License at
        echo.
        echo     http://www.apache.org/licenses/LICENSE-2.0
        echo.
        echo Unless required by applicable law or agreed to in writing, software
        echo distributed under the License is distributed on an 'AS IS' BASIS,
        echo WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
        echo See the License for the specific language governing permissions and
        echo limitations under the License.
    ) >>LICENSE
) else if /i "!license_choice!"=="c" (
    set "license_text=GPL-2.0 License"
    (
        echo Copyright %date:~10,4% %author_name%
        echo.
        echo This program is free software; you can redistribute it and/or modify
        echo it under the terms of the GNU General Public License as published by
        echo the Free Software Foundation; either version 2 of the License, or
        echo (at your option) any later version.
        echo.
        echo This program is distributed in the hope that it will be useful,
        echo but WITHOUT ANY WARRANTY; without even the implied warranty of
        echo MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
        echo GNU General Public License for more details.
        echo.
        echo You should have received a copy of the GNU General Public License
        echo along with this program; if not, write to the Free Software
        echo Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301, USA.
    ) >>LICENSE
) else if /i "!license_choice!"=="d" (
    set "license_text=GPL-3.0-only License"
    (
        echo Copyright %date:~10,4% %author_name%
        echo.
        echo This program is free software; you can redistribute it and/or modify it
        echo under the terms of the GNU General Public License as published by
        echo the Free Software Foundation; either version 3, or (at your option) any later version.
        echo.
        echo This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY;
        echo without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
        echo See the GNU General Public License for more details.
        echo.
        echo You should have received a copy of the GNU General Public License along with this program;
        echo if not, write to the Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
        echo Boston, MA 02110-1301, USA.
    ) >>LICENSE
) else if /i "!license_choice!"=="e" (
    set "license_text=MPL-2.0 License"
    (
        echo Copyright %date:~10,4% %author_name%
        echo.
        echo This Source Code Form is subject to the terms of the Mozilla Public
        echo License, v. 2.0. If a copy of the MPL was not distributed with this file,
        echo You can obtain one at http://mozilla.org/MPL/2.0/.
    ) >>LICENSE
) else if /i "!license_choice!"=="f" (
    set "license_text=BSD-2-Clause License"
    (
        echo Copyright %date:~10,4% %author_name%
        echo.
        echo Redistribution and use in source and binary forms, with or without modification,
        echo are permitted provided that the following conditions are met:
        echo.
        echo 1. Redistributions of source code must retain the above copyright notice,
        echo    this list of conditions and the following disclaimer.
        echo.
        echo 2. Redistributions in binary form must reproduce the above copyright notice,
        echo    this list of conditions and the following disclaimer in the documentation
        echo    and/or other materials provided with the distribution.
        echo.
        echo THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS 'AS IS' AND
        echo ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
        echo WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.
        echo IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT,
        echo INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT
        echo NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
        echo PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
        echo WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
        echo ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
        echo POSSIBILITY OF SUCH DAMAGE.
    ) >>LICENSE
) else if /i "!license_choice!"=="g" (
    set "license_text=BSD-3-Clause License"
    (
        echo Copyright %date:~10,4% %author_name%
        echo.
        echo Redistribution and use in source and binary forms, with or without modification,
        echo are permitted provided that the following conditions are met:
        echo.
        echo 1. Redistributions of source code must retain the above copyright notice,
        echo    this list of conditions and the following disclaimer.
        echo.
        echo 2. Redistributions in binary form must reproduce the above copyright notice,
        echo    this list of conditions and the following disclaimer in the documentation
        echo    and/or other materials provided with the distribution.
        echo.
        echo 3. Neither the name of the copyright holder nor the names of its contributors
        echo    may be used to endorse or promote products derived from this software without
        echo    specific prior written permission.
        echo.
        echo THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS 'AS IS' AND
        echo ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
        echo WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.
        echo IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT,
        echo INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT
        echo NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
        echo PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
        echo WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
        echo ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
        echo POSSIBILITY OF SUCH DAMAGE.
    ) >>LICENSE
) else if /i "!license_choice!"=="q" (
    exit /b 0
) else (
    echo Invalid option. Please select 'a' for MIT License, 'b' for Apache-2.0, 'c' for GPL-2.0, 'd' for GPL-3.0-only, 'e' for MPL-2.0, 'f' for BSD-2-Clause, 'g' for BSD-3-Clause, or 'q' to Quit.
    goto license_menu
)

REM Create Python files in the src directory
copy NUL "src\!project_name!.py"
copy NUL "src\settings.py"

REM Add shebang, import statement, and PySimpleGUI boilerplate to !project_name!.py
echo #!/usr/bin/env python>"src\!project_name!.py"
(
    echo import PySimpleGUI as sg
    echo import settings as st
    echo.
    echo def main():
    echo     layout = [
    echo                 [sg.Text('Hello, PySimpleGUI!')],
    echo                 [sg.Button('OK')]
    echo             ]
    echo.
    echo     window = sg.Window('PySimpleGUI Window', layout)
    echo.
    echo     while True:
    echo         event, values = window.read()
    echo         if event == sg.WINDOW_CLOSED or event == 'OK':
    echo             break
    echo.
    echo     window.close()
    echo.
    echo if __name__ == '__main__':
    echo     main()
) >>"src\!project_name!.py"

REM Create required files in the project directory
set "project_date=%date%"
(
    echo # !project_name!
    echo.
    echo ## License
    echo.
    echo This project is licensed under the !license_text!.
    echo Author: !author_name!
    echo Date: !project_date!
) >README.md
copy NUL CHANGES.md
echo !project_name! project initialized by !author_name! on !project_date!>CHANGES.md
echo.>>CHANGES.md

REM Success message
cls
echo.
echo PySimpleGUI project '!project_name!' with the !license_text! has been initialized successfully.
echo.
echo This terminal will close in 3 seconds
timeout /t 3 >nul
exit

