using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.IO;
using DataAccessLayer;
using BusinessLayer;

namespace FirstFrame.UserSetting
{
    public partial class RoomService : System.Web.UI.Page
    {
        RoomServiceRepository roomRepo = new RoomServiceRepository();
        RoomServiceInformation roomInfomation =  new RoomServiceInformation();
        RoomServiceHandler roomServiceHandler = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (!Page.IsPostBack)
            {
                if (Session["UserName"] == null)
                {
                    Response.Redirect("Login.aspx");
                }
                else
                {
                    UserInformation userInformation = new UserInformation();
                    UserInformationHandler userHandler = new UserInformationHandler();
                    userInformation.Email = Session["UserName"].ToString().Trim();
                    byte[] image = (byte[])userHandler.GetPhoto(userInformation.Email);
                    string imageData = Convert.ToBase64String(image);
                    ImageUser.ImageUrl = "data:Image/png;base64," + imageData;

                    string id = Request.QueryString["id"] as string;
                    if (id != null)
                    {
                        FillDropDownLists();
                        ReDataBinding(id.Trim());
                    }
                    else
                    {
                        FillDropDownLists();
                    }
                    BindDataGridView();
                }

            }

            
        }       

        protected void DropDownListCity_SelectedIndexChanged(object sender, EventArgs e)
        {
            //Session["City"] = DropDownListCity.SelectedValue.ToString();
            //if (DropDownListCity.SelectedIndex > 0)
            //{
            //    DropDownListTownship.DataSource = roomRepo.GetDataTable("Township", "CityID = '" + DropDownListCity.SelectedIndex + "'");
            //    DropDownListTownship.DataValueField = "ID";
            //    DropDownListTownship.DataTextField = "Name";
            //    DropDownListTownship.DataBind();
            //    DropDownListTownship.Items.Insert(0, new ListItem("-- Select Township--", "0"));
            //}
            //else
            //{
            //    DropDownListTownship.DataSource = roomRepo.GetDataTable("Township");
            //    DropDownListTownship.DataValueField = "ID";
            //    DropDownListTownship.DataTextField = "Name";
            //    DropDownListTownship.DataBind();
            //    DropDownListTownship.Items.Insert(0, new ListItem("-- Select Township--", "0"));
            //}
        }

        protected void DropDownListCity_TextChanged(object sender, EventArgs e)
        {
            //Session["City"] = DropDownListCity.SelectedValue.ToString();
            //if (DropDownListCity.SelectedIndex > 0)
            //{
            //    DropDownListTownship.DataSource = roomRepo.GetDataTable("Township", "CityID = '" + DropDownListCity.SelectedIndex + "'");
            //    DropDownListTownship.DataValueField = "ID";
            //    DropDownListTownship.DataTextField = "Name";
            //    DropDownListTownship.DataBind();
            //    DropDownListTownship.Items.Insert(0, new ListItem("-- Select Township--", "0"));
            //}
            //else
            //{
            //    DropDownListTownship.DataSource = roomRepo.GetDataTable("Township");
            //    DropDownListTownship.DataValueField = "ID";
            //    DropDownListTownship.DataTextField = "Name";
            //    DropDownListTownship.DataBind();
            //    DropDownListTownship.Items.Insert(0, new ListItem("-- Select Township--", "0"));
            //}
            
        }

        #region <Local Functions>

        protected void ReDataBinding(string ID)
        {
            //object[] Controls = GetFormControls();
            
            RoomServiceHandler roomService = new RoomServiceHandler();
            roomInfomation = new RoomServiceInformation();
            object[] roomInfo = roomService.GetRoomService(ID);
            //object[] getProperty = GetPropertiesValue(roomInfomation);
            //int count = Controls.Length;
            //for (int i = 0; i < count; i++)
            //{
            //    Controls[i] = roomInfo[i];
            //}
            txtTitle.Text = roomInfo[1].ToString();
            radioSaleRent.SelectedValue = roomInfo[2].ToString();
            DropDownListPropertyType.SelectedValue = roomInfo[18].ToString();
            txtWidth.Text = roomInfo[4].ToString();
            txtLength.Text = roomInfo[5].ToString();
            txtSqrt.Text = roomInfo[6].ToString();
            DropDownListFloor.SelectedValue = roomInfo[19].ToString();
            radioCurrency.SelectedValue = roomInfo[8].ToString();
            txtPrice.Text = roomInfo[9].ToString();
            DropDownListDecoration.SelectedValue = roomInfo[20].ToString();
            DropDownListBedRoom.SelectedValue = roomInfo[21].ToString();
            DropDownListBathRoom.SelectedValue = roomInfo[22].ToString();
            DropDownListCity.SelectedValue = roomInfo[23].ToString();
            DropDownListTownship.SelectedValue = roomInfo[24].ToString();
            txtContactNumber.Text = roomInfo[15].ToString();
            txtDetailInformation.Text = roomInfo[16].ToString();

        }
        protected void FillDropDownLists()
        {

            DropDownListPropertyType.DataSource = roomRepo.GetDataTable("PropertyType");
            DropDownListPropertyType.DataValueField = "ID";
            DropDownListPropertyType.DataTextField = "Name";
            DropDownListPropertyType.DataBind();
            DropDownListPropertyType.Items.Insert(0, new ListItem("-- Select Property Type--", "0"));


            DropDownListDecoration.DataSource = roomRepo.GetDataTable("Decoration");
            DropDownListDecoration.DataValueField = "ID";
            DropDownListDecoration.DataTextField = "Name";
            DropDownListDecoration.DataBind();
            DropDownListDecoration.Items.Insert(0, new ListItem("-- Select Decoration --", "0"));

            DropDownListCity.DataSource = roomRepo.GetDataTable("City");
            DropDownListCity.DataValueField = "ID";
            DropDownListCity.DataTextField = "Name";
            DropDownListCity.DataBind();
            DropDownListCity.Items.Insert(0, new ListItem("-- Select City --", "0"));

            DropDownListTownship.DataSource = roomRepo.GetDataTable("Township");
            DropDownListTownship.DataValueField = "ID";
            DropDownListTownship.DataTextField = "Name";
            DropDownListTownship.DataBind();
            DropDownListTownship.Items.Insert(0, new ListItem("-- Select Township--", "0"));


            DropDownListFloor.DataSource = roomRepo.GetDataTable("RoomFloor");
            DropDownListFloor.DataValueField = "ID";
            DropDownListFloor.DataTextField = "FloorTh";
            DropDownListFloor.DataBind();
            DropDownListFloor.Items.Insert(0, new ListItem("-- Select Floor --", "0"));

            DropDownListBathRoom.DataSource = roomRepo.GetDataTable("BathRoom");
            DropDownListBathRoom.DataValueField = "ID";
            DropDownListBathRoom.DataTextField = "Name";
            DropDownListBathRoom.DataBind();
            DropDownListBathRoom.Items.Insert(0, new ListItem("-- Select Bath Room --", "0"));

            DropDownListBedRoom.DataSource = roomRepo.GetDataTable("BedRoom");
            DropDownListBedRoom.DataValueField = "ID";
            DropDownListBedRoom.DataTextField = "Name";
            DropDownListBedRoom.DataBind();
            DropDownListBedRoom.Items.Insert(0, new ListItem("-- Select Bed Room --", "0"));
        }
        protected void UploadFile(object sender, EventArgs e)
        {
            //if (fileUpload.HasFiles)
            //{
            //    foreach (HttpPostedFile files in fileUpload.PostedFiles)
            //    {
            //        string fileName = Path.GetFileName(fileUpload.PostedFile.FileName);
            //        fileUpload.PostedFile.SaveAs(Server.MapPath("~/VaultServer/") + fileName);
            //        fileLists.Text += String.Format("{0}<br/>", fileUpload.FileName);
            //    }
            //}
            
            //Response.Redirect(Request.Url.AbsoluteUri);
        }

        protected string GetFilePath()
        {
            string fileName = Path.GetFileName(fileUpload.PostedFile.FileName);
            string filePath = Server.MapPath("~/VaultServer/") + fileName;
            return filePath;
        }
        protected object[] GetFormControls()
        {
            object[] Controls = { txtTitle.Text,radioSaleRent.SelectedValue,DropDownListPropertyType.SelectedValue,
                                txtWidth.Text,txtLength.Text,txtSqrt.Text,DropDownListFloor.SelectedValue,radioCurrency.SelectedValue,txtPrice.Text,DropDownListDecoration.SelectedItem.Value,
                                DropDownListBedRoom.SelectedValue,DropDownListBathRoom.SelectedValue,DropDownListCity.SelectedValue,
                                DropDownListTownship.SelectedItem.Value,txtContactNumber.Text,txtDetailInformation.Text,fileLists.Text};
            return Controls;
        }
        public object[] GetPropertiesValue(RoomServiceInformation roomInfo)
        {
            object[] roomInformation = { roomInfo.ID, roomInfo.Title, roomInfo.SaleRent, roomInfo.PropertyType, roomInfo.Width, roomInfo.Length, roomInfo.Sqrt, roomInfo.Floor, roomInfo.Currency, roomInfo.Price, roomInfo.Decoration, roomInfo.BedRoom, roomInfo.BathRoom, roomInfo.City, roomInfo.Township, roomInfo.ContactNumber, roomInfo.DetailInformation, roomInfo.FilePath };
            return roomInformation;
        }

        private void  BindDataGridView()
        {
            roomServiceHandler = new RoomServiceHandler();
            dgvRoomService.DataSource = roomServiceHandler.GetRoomServiceList();
            dgvRoomService.DataBind();

            #region<For Responsive Gird View>

            dgvRoomService.UseAccessibleHeader = true;
            dgvRoomService.HeaderRow.TableSection = TableRowSection.TableHeader;
            TableCellCollection cells = dgvRoomService.HeaderRow.Cells;
            int cellCount = dgvRoomService.HeaderRow.Cells.Count;
            string key = "data-class";
            string key1 = "data-hide";
            string value = "expand";
            string value1 = "phone,tablet";
            string value2 = "phone,tablet,laptop,smallcomputer,computer,bigcomputer";
            
            for (int i = 1; i < cellCount; i++)
            {
                if (i==1)
                {
                    cells[i].Attributes.Add(key, value);
                }
                else  if (i == 3 || i == 4 || i == 5 || i == 11 || i == 12 || i == 16 || i == 17 || i == 18)
                {
                    cells[i].Attributes.Add(key1, value2);
                }
                else 
                {
                    cells[i].Attributes.Add(key1, value1);
                }

            }
            #region<Bad Codes by Myself>
            /*
            cells[1].Attributes.Add("data-class", "expand");
            cells[3].Attributes.Add("data-hide", "phone,tablet,laptop,smallcomputer,computer,bigcomputer");
            cells[4].Attributes.Add("data-hide", "phone,tablet,laptop,smallcomputer,computer,bigcomputer");
            cells[5].Attributes.Add("data-hide", "phone,tablet,laptop,smallcomputer,computer,bigcomputer");
            cells[6].Attributes.Add("data-hide", "phone,tablet");
            cells[7].Attributes.Add("data-hide", "phone,tablet");
            cells[8].Attributes.Add("data-hide", "phone,tablet");
            cells[9].Attributes.Add("data-hide", "phone,tablet");
            cells[10].Attributes.Add("data-hide", "phone,tablet");
            cells[11].Attributes.Add("data-hide", "phone,tablet,laptop,smallcomputer,computer,bigcomputer");
            cells[12].Attributes.Add("data-hide", "phone,tablet,laptop,smallcomputer,computer,bigcomputer");
            cells[13].Attributes.Add("data-hide", "phone,tablet");
            cells[14].Attributes.Add("data-hide", "phone,tablet");
            cells[15].Attributes.Add("data-hide", "phone,tablet");
            cells[16].Attributes.Add("data-hide", "phone,tablet,laptop,smallcomputer,computer,bigcomputer");
            cells[17].Attributes.Add("data-hide", "phone,tablet,laptop,smallcomputer,computer,bigcomputer");
            cells[18].Attributes.Add("data-hide", "phone,tablet,laptop,smallcomputer,computer,bigcomputer");
            */
            #endregion

            #endregion
        }

        private void FileDownload(string fileName)
        {
           
                System.Web.HttpResponse response = System.Web.HttpContext.Current.Response;
                response.ClearContent();
                response.ClearHeaders();
                response.Clear();
                response.AddHeader("Content-Disposition", "attachment; filename=" + fileName + ";");
                string ServerPath = Server.MapPath("~/VaultServer/") + fileName;
                response.TransmitFile(ServerPath);
                response.Flush();
                response.End();     
            
        }

        #endregion
        protected void btnPost_Click(object sender, EventArgs e)
        {
            string bath = DropDownListBathRoom.SelectedItem.Value;
            string City = DropDownListCity.SelectedItem.Value;
            object[] frmControls = GetFormControls();
            object[] para = GetPropertiesValue(roomInfomation);
            int controlCount = frmControls.Length;          
            RoomServiceHandler roomService = new RoomServiceHandler();

            if (Session["rOOmInfoID"] == null)
            {
                for (int i = 0; i < controlCount; i++)
                {
                    para[i + 1] = frmControls[i];
                }
                if (roomService.AddRoomServiceInformation(para))
                {
                    UploadFile(sender, e);
                    Response.Clear();
                }
            }
            else
            {
                for (int i = 0; i < controlCount+1; i++)
                {
                    if (i == 0)
                        para[i] = Session["rOOmInfoID"].ToString();
                    else
                    para[i] = frmControls[i-1];
                }
                if (roomService.UpdateRoomService(para))
                {
                    UploadFile(sender, e);
                    Response.Clear();
                }
                Session["rOOmInfoID"] = null;
            }
            BindDataGridView();
        }

        protected void DropDownListPropertyType_TextChanged(object sender, EventArgs e)
        {
            Session["PropertyType"] = DropDownListPropertyType.SelectedItem.Value;
        }

        protected void dgvRoomService_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void dgvRoomService_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            dgvRoomService.PageIndex = e.NewPageIndex;
            BindDataGridView();
        }

        protected void dgvRoomService_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            string ID = string.Empty;
            if (e.CommandName == "edit")
            {
                ID = e.CommandArgument.ToString();
                ReDataBinding(ID);
                Session["rOOmInfoID"] = ID;
            }
            if (e.CommandName == "remove")
            {
                ID = e.CommandArgument.ToString();
                roomServiceHandler = new RoomServiceHandler();
                if (roomServiceHandler.DeleteRoomService(ID))
                {
                    Label lblDelete = new Label();
                    lblDelete.Text = "This record has been deleted!";
                }
            }
            if (e.CommandName=="download")
            {
                ID = e.CommandArgument.ToString();
                List<string> fileNames = ID.Replace("<br/>", "").Split(',').ToList<string>();
                fileNames.Reverse();
                foreach (string fileName in fileNames)
                {
                    FileDownload(fileName);
                }
                
            }
            if (e.CommandName == "copy")
            {
                ID = e.CommandArgument.ToString();
                roomServiceHandler = new RoomServiceHandler();
                if (roomServiceHandler.CopyRoomService(ID))
                {
                    Label lblCopy = new Label();
                    lblCopy.Text = "This recored has been copied";
                }
            }
            BindDataGridView();
        }

        protected void dgvRoomService_RowEditing(object sender, GridViewEditEventArgs e)
        {

        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            txtTitle.Text = string.Empty;
            radioSaleRent.ClearSelection();
            DropDownListPropertyType.SelectedValue = "0";
            txtWidth.Text = string.Empty;
            txtLength.Text = string.Empty;
            txtSqrt.Text = string.Empty;
            DropDownListFloor.SelectedValue = "0";
            radioCurrency.ClearSelection();
            txtPrice.Text = "0";
            DropDownListDecoration.SelectedValue = "0";
            DropDownListBedRoom.SelectedValue = "0";
            DropDownListBathRoom.SelectedValue = "0";
            DropDownListCity.SelectedValue = "0";
            DropDownListTownship.SelectedValue = "0";
            txtContactNumber.Text = string.Empty;
            txtDetailInformation.Text = string.Empty;
            fileLists.Text = "";
            BindDataGridView();
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            if (fileUpload.HasFiles)
            {
                foreach (HttpPostedFile files in fileUpload.PostedFiles)
                {
                    //string fileName = Path.GetFileName(fileUpload.PostedFile.FileName); //For single File
                    string fileName = Path.GetFileName(files.FileName);
                    fileUpload.PostedFile.SaveAs(Server.MapPath("~/VaultServer/") + fileName);
                    if (fileLists.Text.Length < 1)
                    {
                        fileLists.Text ="<a href='#'>" + fileName + "</a>";
                    }
                    else
                    {
                        fileLists.Text += ",<br/> <a href='#'>" + String.Format("{0}", fileName) + "</a>";
                    }
                    
                }
            }
            BindDataGridView();
            //Response.Redirect(Request.Url.AbsoluteUri);
        }
    }
}