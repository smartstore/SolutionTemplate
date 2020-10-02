using System.Web.Mvc;
using System.Web.Routing;
using SmartStore.Web.Framework.Routing;

namespace SmartStore.Plugin.HelloWorld
{
    public partial class RouteProvider : IRouteProvider
    {
        public void RegisterRoutes(RouteCollection routes)
        {
            routes.MapRoute("SmartStore.HelloWorld",
                 "Plugins/HelloWorld/{action}",
                 new { controller = "HelloWorld", action = "Configure" },
                 new[] { "SmartStore.HelloWorld.Controllers" }
            )
            .DataTokens["area"] = "SmartStore.HelloWorld";
        }

        public int Priority
        {
            get
            {
                return 0;
            }
        }
    }
}
