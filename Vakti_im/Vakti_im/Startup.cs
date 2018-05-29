using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(Vakti_im.Startup))]
namespace Vakti_im
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
