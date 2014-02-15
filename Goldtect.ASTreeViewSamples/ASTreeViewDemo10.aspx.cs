#region using
using System;
using System.Xml;

#endregion


namespace Goldtect.ASTreeViewDemo
{
    public partial class ASTreeViewDemo10 : PageBase
    {
        #region overrided methods
        /// <summary>
        /// OnInit
        /// </summary>
        /// <param name="e"></param>
        protected override void OnInit( EventArgs e )
        {
            InitializeComponent();
            base.OnInit( e );
        }
        #endregion

        #region event handlers (Page_Load etc...)

        /// <summary>
        /// Page load logic
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Page_Load( object sender, EventArgs e )
        {
            if( !IsPostBack )
                GenerateTree();
        }

        protected override void OnPreRender( EventArgs e )
        {
            base.OnPreRender( e );

            //link the css file
            this.lASTreeViewThemeCssFile.Text = "<link id='astreeviewcssfile' href='' type='text/css' rel='stylesheet' />";

            string script = string.Format( "document.getElementById('astreeviewcssfile').href='{0}'", this.astvMyTree.ThemeCssFile );
            this.ClientScript.RegisterStartupScript( this.GetType(), "js" + Guid.NewGuid().ToString(), script, true );

        }

        protected void btnRightLeft_Click( object sender, EventArgs e )
        {
            ASTreeViewTheme rightLeft = new ASTreeViewTheme();
            rightLeft.BasePath = "~/Scripts/astreeview/themes/right-left/";
            rightLeft.CssFile = "right-left.css";
            this.astvMyTree.Theme = rightLeft;
            this.astvMyTree.EnableTreeLines = true;
            this.astvMyTree.EnableRightToLeftRender = true;

            this.divConsole.InnerHtml += ( string.Format( ">>{0}</br>", "Right to left theme." ) );

        }

        protected void btnThemeMacOS_Click( object sender, EventArgs e )
        {
            ASTreeViewTheme macOS = new ASTreeViewTheme();
            macOS.BasePath = "~/Scripts/astreeview/themes/macOS/";
            macOS.CssFile = "macOS.css";
            this.astvMyTree.Theme = macOS;
            this.astvMyTree.EnableTreeLines = false;
            this.astvMyTree.EnableRightToLeftRender = false;

            this.divConsole.InnerHtml += ( string.Format( ">>{0}</br>", "MacOS theme." ) );
        }

        protected void btnThemeVista_Click( object sender, EventArgs e )
        {
            ASTreeViewTheme vista = new ASTreeViewTheme();
            vista.BasePath = "~/Scripts/astreeview/themes/vista/";
            vista.CssFile = "vista.css";
            this.astvMyTree.Theme = vista;
            this.astvMyTree.EnableTreeLines = false;
            this.astvMyTree.EnableRightToLeftRender = false;

            this.divConsole.InnerHtml += ( string.Format( ">>{0}</br>", "Vista theme." ) );
        }

        protected void btnThemeDefault_Click( object sender, EventArgs e )
        {
            ASTreeViewTheme defaultTheme = new ASTreeViewTheme();
            defaultTheme.BasePath = "~/Scripts/astreeview/themes/default/";
            defaultTheme.CssFile = "right-left.css";
            this.astvMyTree.Theme = defaultTheme;
            this.astvMyTree.EnableTreeLines = true;
            this.astvMyTree.EnableRightToLeftRender = false;

            this.divConsole.InnerHtml += ( string.Format( ">>{0}</br>", "Default theme." ) );
        }
        #endregion

        #region private methods

        /// <summary>
        /// initial controls, bind you events etc. here
        /// </summary>
        private void InitializeComponent()
        {

        }

        private void GenerateTree()
        {
            ASTreeViewTheme defaultTheme = new ASTreeViewTheme();
            defaultTheme.BasePath = "~/Scripts/astreeview/themes/default/";
            defaultTheme.CssFile = "right-left.css";
            this.astvMyTree.Theme = defaultTheme;
            
            XmlDocument doc = new XmlDocument();
            doc.Load( Server.MapPath( "~/ASTreeViewDemo4_Sample_Data.xml" ) );

            ASTreeViewXMLDescriptor descripter = new ASTreeViewXMLDescriptor();

            this.astvMyTree.DataSourceDescriptor = descripter;
            this.astvMyTree.DataSource = doc;
            this.astvMyTree.DataBind();

        }

        #endregion
    }
}
