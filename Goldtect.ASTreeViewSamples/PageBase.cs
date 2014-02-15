using System.Web.UI;

namespace Goldtect.ASTreeViewDemo
{
	public class PageBase : Page
	{
		protected string NorthWindConnectionString
		{
			get
			{
				//bind data from data table
				string path = Server.MapPath( "~/" ); //System.AppDomain.CurrentDomain.BaseDirectory;
				string connStr = string.Format( "Provider=Microsoft.Jet.OLEDB.4.0;Data source={0}db\\NorthWind.mdb", path );

				return connStr;
			}
		}
	}
}
