using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Http;

namespace EmployeeWebsite
{
    public static class WebApiConfig
    {
        public static void Register(HttpConfiguration Config)
        {
            // Web API Configuration and services

            // Web API routes
            Config.MapHttpAttributeRoutes();

            Config.Routes.MapHttpRoute(
                name: "DefaultApi",
                routeTemplate: "api/{Controller}/{action}/{id}",
                defaults: new { id = RouteParameter.Optional }
            );
        }
    }
}
