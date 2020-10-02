# SmartStoreDEV

Dieses Repository soll Entwickler in die Lage versetzen, in einer perfekten Entwicklungsumgebung für die Entwicklung von Plugins, Tests oder Themes, inklusive aller möglichen Deployment-Scenarien arbeiten zu können. 

Da man als Entwickler manchmal schnell sehen will, was einen erwartet, nenne ich die folgende Sektion den **Sprung ins kalte Wasser**

1. Forken
2. \SmartStoreDEV\create-symlinks.bat ausführen
3. \SmartStoreDEV\extra-plugins\create-symlinks.bat ausführen
4. Solution über Symlink öffnen \SmartStoreDEV\SmartStoreNET\src\SmartStoreNET.Dev-sym.sln

Jetzt sieht man:

1. Ein nicht öffentliches Plugin, das in diesem privaten Repository residiert (Solution > Plugin > MyPlugins). 
2. Ein nicht öffentliches Plugin, das in diesem privaten Repository residiert (Solution > SmartStore.Web > Themes > CMS).

## Commercial Plugins ##

Wenn Sie eine gültige Smartstore Lizenz erworben haben, erhalten Sie bei jedem Release von Smartstore aktualsierte Plugins für die aktuelle Version. Kopieren Sie diese in den Ordner commercial-plugins. Führen Sie jetzt die darin enthaltene Datei create-symlinks.bat aus. Nun sind die Plugins im lokalen Shop, in dem entwickelt wird verfügbar. Da diese jedoch nicht quelloffen sind, wurden sie auch nicht der Solutiuon zugefügt und können nicht bearbeitet werden. 

Jedes Mal, wenn Sie diesem Ordner ein neues Plugin hinzufügen, weil Sie z.B. eins im Marketplace gekauft haben oder durch ein Smartstore Release neue zugefügt wurden, muss die bat-Datei erneut ausgeführt werden um die neu hinzugekommenen Plugin über einen Symlink zu referenzieren.    

## Plugin-Entwicklung ##

Wenn Sie jetzt ein Plugin in Ihrem privaten Repository entwickeln möchten, gehen Sie wie folgt vor.
 
1. Erstellen Sie das Plugin-Projekt. An dieser Stelle muss unsere [VS-Extension](https://marketplace.visualstudio.com/items?itemName=SmartStoreAG.Smartstore) erwähnt werden, mit deren Hilfe Sie Plugins für Smartstore schnell und effektiv erstellen können 
2. Der physikalische Ort für Ihr Plugin ist \SmartStoreDEV\src\Plugins
3. Öffnen Sie die Datei create-symlinks.bat mit einem Text-Editor und fügen den Namen des Plugin-Ordners hinzu.

Wenn hier vorher beispielsweise folgendes stand:

    set linkedplugins=SmartStore.HelloWorld, SmartStore.HelloWorld2

und ihr Plugin *SmartStore.HelloWorld3* heißt, sieht die Zeile jetzt so aus

    set linkedplugins=SmartStore.HelloWorld, SmartStore.HelloWorld2, SmartStore.HelloWorld3

4. Führen Sie nun die bat-Datei aus. Jetzt wurde ein sym-Link im Ordner \SmartStoreDEV\SmartStoreNET\src\Plugins
erstellt. Über diesen Symlink ist das komplette Plugin-Projekt in der Solution verfügbar, lauffähig und kann gedebugged werden, obwohl es physikalisch außer Reichweite liegt. 

5. Fügen Sie das neue Projekt über diesen Symlink der Solution hinzu. 

## Build Solution ##

Wenn Sie jetzt die Datei build-dev.zip ausführen wird Ihr Shop inklusive aller gekauften Plugin und aller selbstentwickelten Plugins erstellt und kann auf den Server geladen werden.



# TODO: Finish the job #
Theme muss erst zur Solution zugefügt werden > Kaka
Theme könnte auch als MVC-Projekt eingebunden werden.
Build geht noch nicht