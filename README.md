# Smartstore Solution Template

This repository enables developers to work in a perfect development environment for developing plugins, tests or themes, inclusive every conceivable deployment scenario. 

## Quick start ##

To get a quick insight into plugin & theme development in private repositories, follow the steps below. 

1. Fork this repository
2. Pull submodules SmartStoreNET & extra-plugins
3. Run *\SmartStoreDEV\create-symlinks.bat*
4. Run *\SmartStoreDEV\extra-plugins\create-symlinks.bat*
5. Open solution via symlink directly in Visual Studio *\SmartStoreDEV\SmartStoreNET\src\SmartStoreNET.Dev-sym.sln*
(since loading the solution in visual studio via context menu is not working correctly when using symlinks)
6. Right click solution *SmartStoreNET.Dev-sym* within *Visual Studio* and select *Restore NuGet Packages*
7. Set *SmartStore.Web* as Startup project
8. Build and Run your solution

Result:

1. A non-public plugin that resides in this private repository (Solution > Plugin > MyPlugins)
2. A non-public theme that is located in this private repository (Solution > SmartStore.Web > Themes > CMS)

## Commercial plugins ##

If you have purchased a valid Smartstore licence, you will receive updated plugins for the current version with every release of Smartstore. Copy them into the *commercial-plugins* folder and execute the file *create-symlinks.bat* contained in it. The plugins are now available in the local shop where development is taking place. 
As these plugins are not open source, they have not been added to the solution and cannot be edited.

Every time you add a new plugin to this folder, e.g. because you bought one in the marketplace or new ones were added by a Smartstore release, the batch file has to be executed again to reference the newly added plugins with a symlink.

## Plugin development ##

If you want to develop a plugin in your private repository, proceed as follows.
 
1. Create the plugin project. At this point, our [VS extension](https://marketplace.visualstudio.com/items?itemName=SmartStoreAG.Smartstore) should be mentioned, which allows you to create plugins for Smartstore quickly and effectively
2. The physical location for your plugin is *\SmartStoreDEV\src\Plugins*
3. Open the file *create-symlinks.bat* with a text editor and add the name of the plugin folder to it.

If, for example, the following was written before:

	set linkedplugins=SmartStore.HelloWorld, SmartStore.HelloWorld2

If your plugin is called SmartStore.HelloWorld3, the edited line will looks like this:

    set linkedplugins=SmartStore.HelloWorld, SmartStore.HelloWorld2, SmartStore.HelloWorld3

4. Execute the batch file. A symlink has now been created in the folder *\SmartStoreDEV\SmartStoreNET\src\Plugins*. With this symlink the complete plugin project is available in the solution, executable and can be debugged although it is physically out of reach.

5. Add the new project to the solution via this symlink  

## Theme development (without MVC project) ##

This repository contains a simple example theme (CMS) to better illustrate the development process. This theme must first be added to the solution in **SmartStore.Web > Themes > CMS > [Context menu] > *Include In Project***.

Since the symlink of this theme does not have the extension .sym, it is not ignored by the .gitignore, unlike the plugins in the SmartStoreNET submodule. The files of the theme appear in the submodule in the list of files that git has recognized as new or changed and wants to push them. But since the theme should remain in this private repository and will be further developed and pushed here, we should write a corresponding statement in the exclude file of the submodule. 

Open the file *\SmartStoreDEV\.git\modules\SmartStoreNET\info\exclude*

and add the following line:

    /src/Presentation/SmartStore.Web/Themes/CMS

You can read more about the development of themes [here](http://docs.smartstore.com/display/SMNET/How+to+write+a+Theme#space-menu-link-content).

## Build solution ##

To create your solution, inclusive all purchased plugins (from the *commercial-plugins* folder) and all self-developed plugins, execute the file *build-with-plugins.cmd*. This file creates the entire shop and copies it into the folder: *\SmartStoreDEV\SmartStoreNET\build\Web*. This folder can now be loaded onto the server.

Execute *build-with-plugins-zip.cmd* if you also want to create a zip file from the folder.

If you are using your own theme that is to be created by the build process, you must first enter the folder name of your theme in the *SmartStoreNET.Dev.proj* file (line 11) in the *ThemeName* node. Execute the file *build-full.cmd* or *build-full-zip.cmd* to create the shop including all plugins and your theme.

If you would like to create your theme in your own MVC project, please take a closer look at the target node *DeployTheme* in the file *SmartStoreNET.Dev.proj* and change the lines commented out according to your requirements.