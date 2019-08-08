<?xml version="1.0" encoding="utf-8"?>
<!-- Created by Leo: http://leoeditor.com/leo_toc.html -->
<leo_file xmlns:leo="http://leoeditor.com/namespaces/leo-python-editor/1.1" >
<leo_header file_format="2"/>
<globals/>
<preferences/>
<find_panel_settings/>
<vnodes>
<v t="mhw.20190808084549.2"><vh>Shortcutter</vh>
<v t="mhw.20190808085013.1"><vh>@path ../shortcutter</vh>
<v t="mhw.20190808092452.15"><vh>/conda-forge/</vh></v>
<v t="mhw.20190808092452.14"><vh>/docs/</vh></v>
<v t="mhw.20190808092452.13"><vh>/shortcutter.egg-info/</vh></v>
<v t="mhw.20190808092452.12"><vh>/shortcutter/</vh>
<v t="mhw.20190808085024.7"><vh>@auto __init__.py</vh></v>
<v t="mhw.20190808085024.6"><vh>@auto _version.py</vh></v>
<v t="mhw.20190808085024.5"><vh>@auto base.py</vh></v>
<v t="mhw.20190808085024.4"><vh>@auto exception.py</vh></v>
<v t="mhw.20190808085024.3"><vh>@auto linux.py</vh></v>
<v t="mhw.20190808085024.2"><vh>@auto macos.py</vh></v>
<v t="mhw.20190808085024.1"><vh>@auto windows.py</vh></v>
</v>
<v t="mhw.20190808092452.11"><vh>CHANGE_LOG.md</vh></v>
<v t="mhw.20190808092452.10"><vh>LICENSE</vh></v>
<v t="mhw.20190808092452.9"><vh>MANIFEST.in</vh></v>
<v t="mhw.20190808092452.8"><vh>README.md</vh></v>
<v t="mhw.20190808092452.7"><vh>api.rst</vh></v>
<v t="mhw.20190808092452.6"><vh>setup.cfg</vh></v>
<v t="mhw.20190808092452.5"><vh>setup.py</vh></v>
<v t="mhw.20190808092452.4"><vh>update_and_upload.txt</vh></v>
<v t="mhw.20190808092452.3"><vh>update_rst</vh></v>
<v t="mhw.20190808092452.2"><vh>upload</vh></v>
<v t="mhw.20190808092452.1"><vh>versioneer.py</vh></v>
</v>
</v>
<v t="mhw.20190808090216.1"><vh>modified</vh>
<v t="mhw.20190808092640.11"><vh>ShortCutterWindows(ShortCutter)._create_shortcut_win</vh></v>
</v>
</vnodes>
<tnodes>
<t tx="mhw.20190808084549.2">Easy cross-platform creation of shortcuts supporting virtual and Anaconda environments

Upstream: https://github.com/kiwi0fruit/shortcutter
My fork: https://github.com/maphew/shortcutter.git


@path ../shortcutter
</t>
<t tx="mhw.20190808085013.1"></t>
<t tx="mhw.20190808090216.1">@language python
@tabwidth -4
</t>
<t tx="mhw.20190808092452.1"></t>
<t tx="mhw.20190808092452.10"></t>
<t tx="mhw.20190808092452.11"></t>
<t tx="mhw.20190808092452.12">@path shortcutter</t>
<t tx="mhw.20190808092452.13">@path shortcutter.egg-info</t>
<t tx="mhw.20190808092452.14">@path docs</t>
<t tx="mhw.20190808092452.15">@path conda-forge</t>
<t tx="mhw.20190808092452.2"></t>
<t tx="mhw.20190808092452.3"></t>
<t tx="mhw.20190808092452.4"></t>
<t tx="mhw.20190808092452.5"></t>
<t tx="mhw.20190808092452.6"></t>
<t tx="mhw.20190808092452.7"></t>
<t tx="mhw.20190808092452.8"></t>
<t tx="mhw.20190808092452.9"></t>
<t tx="mhw.20190808092640.11">def _create_shortcut_win(self, shortcut_name, target_path, shortcut_directory, folder=False, icon=None):
    """
    Creates a Windows shortcut file.

    Returns tuple (shortcut_name, target_path, shortcut_file_path)
    """
    icon = r"D:\code-maphew\leo-editor\leo\Icons\LeoApp.ico"
    if not folder:
        shortcut_target_path = target_path
        working_directory = p.dirname(target_path)
        ext = p.splitext(target_path)[1].upper()
        if not icon:
            if ext in self._executable_file_extensions:
                icon = r'%SystemRoot%\System32\imageres.dll,11'
    
    elif not p.isdir(target_path):
        # create a bat script that opens the folder:
        
        wrapper_path = p.join(self.bin_folder_shcut, self.ba('shortcutter__dir__' + self._path_to_name(target_path)))
        with open(wrapper_path, 'w') as f:
            f.write(FOLDER_SHORTCUT.format(path=target_path))
        shortcut_target_path = wrapper_path
        working_directory = self.bin_folder_shcut
        icon = r'%SystemRoot%\explorer.exe,0'

    else:
        shortcut_target_path = target_path
        working_directory = target_path

    shortcut_file_path = p.join(shortcut_directory, shortcut_name + ".lnk")
    shortcut = shell.CreateShortCut(shortcut_file_path)
    shortcut.Targetpath = shortcut_target_path
    shortcut.WorkingDirectory = working_directory
    shortcut.Description = "Shortcut to" + p.basename(target_path)
    if icon:
        shortcut.IconLocation = icon
    shortcut.save()

    return shortcut_name, target_path, shortcut_file_path

</t>
</tnodes>
</leo_file>
