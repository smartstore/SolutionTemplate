using SmartStore.Core.Configuration;

namespace SmartStore.HelloWorld.Settings
{
    public class HelloWorldSettings : ISettings
    {
        public string MyFirstSetting { get; set; }
    }
}