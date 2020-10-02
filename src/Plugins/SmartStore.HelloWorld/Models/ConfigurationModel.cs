using System.Collections.Generic;
using System.Web.Mvc;
using SmartStore.Web.Framework;
using SmartStore.Web.Framework.Modelling;
using System.ComponentModel.DataAnnotations;

namespace SmartStore.HelloWorld.Models
{
    public class ConfigurationModel : ModelBase
    {
        [SmartResourceDisplayName("Plugins.SmartStore.HelloWorld.MyFirstSetting")]
        [AllowHtml]
        public string MyFirstSetting { get; set; }
    }
}