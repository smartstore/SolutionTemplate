# Smartstore Solution Template

Dieses Repository soll Entwickler in die Lage versetzen, in einer perfekten Entwicklungsumgebung für die Entwicklung von Plugins, Tests oder Themes, inklusive aller möglichen Deployment-Szenarien arbeiten zu können. 

## Quick-Start ##

Um schnell einen Einblick in die Plugin- & Theme-Entwicklung in privaten Repositories zu erhalten, führen Sie die nachfolgenden Schritte aus. 

1. Dieses Repository Forken
2. Die Submodule SmartStoreNET & extra-plugins pullen
3. \SmartStoreDEV\create-symlinks.bat ausführen
4. \SmartStoreDEV\extra-plugins\create-symlinks.bat ausführen
5. Solution über Symlink direkt in Visual Studio öffnen \SmartStoreDEV\SmartStoreNET\src\SmartStoreNET.Dev-sym.sln (da die Option Projekte direkt in Visual Studio nachzuladen nicht funktioniert)
6. Solution auswählen und *NuGet Pakete Wiederherstellen* selektieren
7. *SmartStore.Web* als Start-Projekt festlegen
8. Solution kompilieren und ausführen

Ergebnis:

1. Ein nicht öffentliches Plugin, das in diesem privaten Repository residiert (Solution > Plugin > MyPlugins). 
2. Ein nicht öffentliches Theme, das in diesem privaten Repository residiert (Solution > SmartStore.Web > Themes > CMS).

## Commercial Plugins ##

Wenn Sie eine gültige Smartstore Lizenz erworben haben, erhalten Sie bei jedem Release von Smartstore aktualisierte Plugins für die aktuelle Version. Kopieren Sie diese in den Ordner *commercial-plugins*. Führen Sie jetzt die darin enthaltene Datei *create-symlinks.bat* aus. Nun sind die Plugins im lokalen Shop, in dem entwickelt wird, verfügbar. Da diese jedoch nicht quelloffen sind, wurden sie auch nicht der Solution hinzugefügt und können nicht bearbeitet werden. 

Jedes Mal, wenn Sie diesem Ordner ein neues Plugin hinzufügen, weil Sie z.B. eins im Marketplace gekauft haben oder durch ein Smartstore Release neue hinzugefügt wurden, muss die bat-Datei erneut ausgeführt werden, um die neu hinzugekommenen Plugins über einen Symlink zu referenzieren.    

## Plugin-Entwicklung ##

Wenn Sie ein Plugin in Ihrem privaten Repository entwickeln möchten, gehen Sie wie folgt vor.
 
1. Erstellen Sie das Plugin-Projekt. An dieser Stelle muss unsere [VS-Extension](https://marketplace.visualstudio.com/items?itemName=SmartStoreAG.Smartstore) erwähnt werden, mit deren Hilfe Sie Plugins für Smartstore schnell und effektiv erstellen können.
2. Der physikalische Ort für Ihr Plugin ist \SmartStoreDEV\src\Plugins
3. Öffnen Sie die Datei *create-symlinks.bat* mit einem Text-Editor und fügen den Namen des Plugin-Ordners hinzu.

Wenn hier vorher beispielsweise folgendes stand:

    set linkedplugins=SmartStore.HelloWorld, SmartStore.HelloWorld2

und Ihr Plugin *SmartStore.HelloWorld3* heißt, sieht die Zeile jetzt so aus

    set linkedplugins=SmartStore.HelloWorld, SmartStore.HelloWorld2, SmartStore.HelloWorld3

4. Führen Sie nun die bat-Datei aus. Jetzt wurde ein Symlink im Ordner \SmartStoreDEV\SmartStoreNET\src\Plugins
erstellt. Über diesen Symlink ist das komplette Plugin-Projekt in der Solution verfügbar, lauffähig und kann gedebugged werden, obwohl es physikalisch außer Reichweite liegt. 

5. Fügen Sie das neue Projekt über diesen Symlink der Solution hinzu.  

## Theme-Entwicklung (ohne MVC-Projekt) ##

Dieses Repository enthält ein einfaches Beispiel-Theme (CMS) zur besseren Veranschaulichung des Entwicklungsprozesses. Dieses Theme muss zunächst der Solution hinzugefügt werden, unter **SmartStore.Web > Themes > CMS > Kontextmenu > Add to project**. 

Mehr zur Entwicklung von Themes, erfahren Sie [hier](http://docs.smartstore.com/display/SMNET/How+to+write+a+Theme#space-menu-link-content).

## Build Solution ##

Um Ihre Solution, inklusive aller gekauften Plugins (aus dem "commercial"-Ordner) und aller selbstentwickelten Plugins zu erstellen, führen Sie die Datei *build-with-plugins.cmd* aus. Diese erstellt den kompletten Shop und kopiert ihn in den Ordner: \SmartStoreDEV\SmartStoreNET\build\Web. Dieser Ordner kann nun auf den Server geladen werden

Führen Sie die Datei *build-with-plugins-zip.cmd* aus, wenn aus dem erstellten Ordner zusätzlich eine Zip-Datei erstellt werden soll. 

Verwenden Sie ein eigenes Theme, das vom Build-Prozess mit erstellt werden soll, geben Sie bitte zunächst den Ordner-Namen Ihres Themes in der Datei SmartStoreNET.Dev.proj (Zeile 11) im Knoten ThemeName an. Führen Sie die Datei *build-full.cmd* oder *build-full-zip.cmd* aus um den Shop inklusive aller Plugins und Ihres Themes zu erstellen.   

Möchten Sie Ihr Theme in einem eigenen MVC-Projekt erstellen, schauen Sie sich bitte den Target-Knoten DeployTheme der Datei *SmartStoreNET.Dev.proj* genauer an und verändern die auskommentierten Zeile Ihren Anforderungen entsprechend.