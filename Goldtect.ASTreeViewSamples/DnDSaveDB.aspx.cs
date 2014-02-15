#region using
using System;
using System.Data;
using System.Collections.Generic;

#endregion

namespace Goldtect.ASTreeViewDemo
{
    public partial class DnDSaveDB : PageBase
    {
        protected void Page_Load( object sender, EventArgs e )
        {

            if (!IsPostBack)
            {
                BindData();
            }
        }

        private void BindData()
        {
            GenerateTree1();
            GenerateTree2();

            ManageNodeTreeName();
        }


        private void GenerateTree1()
        {

            DataSet ds = OleDbHelper.ExecuteDataset(base.NorthWindConnectionString, CommandType.Text, "select * from [Products1]");

            ASTreeViewDataTableColumnDescriptor descripter = new ASTreeViewDataTableColumnDescriptor("ProductName"
                , "ProductID"
                , "ParentID");

            this.astvMyTree1.DataSourceDescriptor = descripter;
            this.astvMyTree1.DataSource = ds.Tables[0];
            this.astvMyTree1.DataBind();

        }

        private void GenerateTree2()
        {
            DataSet ds = OleDbHelper.ExecuteDataset(base.NorthWindConnectionString, CommandType.Text, "select * from [Products2]");

            ASTreeViewDataTableColumnDescriptor descripter = new ASTreeViewDataTableColumnDescriptor("ProductName"
                , "ProductID"
                , "ParentID");

            this.astvMyTree2.DataSourceDescriptor = descripter;
            this.astvMyTree2.DataSource = ds.Tables[0];
            this.astvMyTree2.DataBind();

        }

        private void ManageNodeTreeName()
        {
            ASTreeView.ASTreeNodeHandlerDelegate nodeDelegate1 = delegate(ASTreeViewNode node)
            {
                node.AdditionalAttributes.Add(new KeyValuePair<string, string>("treeName", "astvMyTree1"));
            };

            astvMyTree1.TraverseTreeNode(this.astvMyTree1.RootNode, nodeDelegate1);

            ASTreeView.ASTreeNodeHandlerDelegate nodeDelegate2 = delegate(ASTreeViewNode node)
            {
                node.AdditionalAttributes.Add(new KeyValuePair<string, string>("treeName", "astvMyTree2"));
            };

            astvMyTree2.TraverseTreeNode(this.astvMyTree2.RootNode, nodeDelegate2);
        }

        protected void btnSaveDragDrop_Click(object sender, EventArgs e)
        {
            string nodeValue = this.txtNodeValue.Text;
            string nodeTreeName = this.txtNodeTreeName.Text;
            string parentValue = this.txtParentValue.Text;
            string parentTreeName = this.txtParentTreeName.Text;

            if (nodeTreeName == parentTreeName)
            {
                //save tree view dnd
                if (nodeTreeName == "astvMyTree1")
                {
                    ChangeParent("[Products1]", int.Parse(nodeValue), int.Parse(parentValue));
                }
                else if (nodeTreeName == "astvMyTree2")
                {
                    ChangeParent("[Products2]", int.Parse(nodeValue), int.Parse(parentValue));
                }
            }
            else if (nodeTreeName == "astvMyTree1" && parentTreeName == "astvMyTree2")
            {
                MoveNode("[Products1]", "[Products2]", int.Parse(nodeValue), int.Parse(parentValue));
            }
            else if (nodeTreeName == "astvMyTree2" && parentTreeName == "astvMyTree1")
            {
                MoveNode("[Products2]", "[Products1]", int.Parse(nodeValue), int.Parse(parentValue));
            }

            BindData();
        }

       
        private void MoveNode(string sourceTableName, string targetTableName, int nodeId, int parentId)
        {
            /*
             * WARNING
             * For Demo purpose, cascade situation is not handled.
             */

            //get the source node text
            string movedNodeText = (string)OleDbHelper.ExecuteScalar(base.NorthWindConnectionString, CommandType.Text, string.Format("select ProductName from {0} where ProductId={1}", sourceTableName, nodeId));

            movedNodeText = movedNodeText.Replace("'", "");

            //delete the source node
            OleDbHelper.ExecuteNonQuery(base.NorthWindConnectionString, CommandType.Text, string.Format("DELETE FROM {0} where ProductId={1}", sourceTableName, nodeId));

            //get new id
            string maxSql = string.Format("select max( productId ) from {0}", targetTableName);
            int max = (int)OleDbHelper.ExecuteScalar(base.NorthWindConnectionString, CommandType.Text, maxSql);
            int newId = max + 1;

            //add new node to target parent
            OleDbHelper.ExecuteNonQuery(base.NorthWindConnectionString, CommandType.Text, string.Format("INSERT INTO {0} (ProductId, ProductName, ParentId) VALUES({1}, '{2}', {3})", targetTableName, newId, movedNodeText, parentId));

        }

        private void ChangeParent(string tableName, int nodeId, int parentId)
        {
            OleDbHelper.ExecuteNonQuery(base.NorthWindConnectionString, CommandType.Text, string.Format("UPDATE {0} SET ParentId={1} WHERE ProductId={2}", tableName, parentId, nodeId));
        }
    }
}
