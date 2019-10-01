using System.Web;
using System.Web.Mvc;

namespace Sistema_Reservas_y_Citas
{
    public class FilterConfig
    {
        public static void RegisterGlobalFilters(GlobalFilterCollection filters)
        {
            filters.Add(new HandleErrorAttribute());
        }
    }
}
