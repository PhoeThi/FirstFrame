<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RoomService.aspx.cs" Inherits="FirstFrame.UserSetting.RoomService" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <title>Room Service</title>
    <meta name="viewport" content="width = device-width, initial-scale = 1.0, minimum-scale = 1.0, maximum-scale = 1.0, user-scalable = no" />
    <link href="../Content/footable.min.css" rel="stylesheet" />
    <link href="../Content/themes/base/jquery-ui.css" rel="stylesheet" />
    <link href="../Content/themes/base/datepicker.css" rel="stylesheet" />
    <script src="Scripts/jquery-3.1.1.js"></script>
    <script src="Scripts/jquery-3.1.1.min.js"></script>
    <script src="Scripts/jquery-ui-1.12.1.js"></script>
    <script src="Scripts/jquery-ui-1.12.1.min.js"></script>
    <script src="Scripts/jquery.js" type="text/javascript"></script>
    <script src="Scripts/jquery.min.js" type="text/javascript"></script>
    <script src="Scripts/jquery-ui.min.js" type="text/javascript"></script>
    <link href="../Content/bootstrap.css" rel="stylesheet" />
    <link href="../Content/bootstrap.min.css" rel="stylesheet" />
    <link href="../Content/bootstrap-theme.css" rel="stylesheet" />
    <script src="Scripts/footable.min.js"></script>


    <%--    <script src="Scripts/jquery-3.1.1.js"></script>
    <script src="Scripts/jquery.dataTables.min.js"></script>
    <script src="../Scripts/DataTables/dataTables.responsive.js"></script>    
    <script src="Scripts/bootstrap.js"></script>
    <script src="Scripts/jquery-ui-1.12.1.min.js"></script>
    <link href="../Content/bootstrap-theme.css" rel="stylesheet" />
    <link href="../Content/jquery.dataTables.min.css" rel="stylesheet" />
    <link href="../Content/DataTables/css/responsive.dataTables.css" rel="stylesheet" />
    <link href="../style.css" rel="stylesheet" />
    <link href="../Content/themes/base/jquery-ui.css" rel="stylesheet" />
    <link href="../Content/themes/base/datepicker.css" rel="stylesheet" />--%>

    <link href="../style.css" rel="stylesheet" />

    <script>
        $('button[name="lkbtnDelete"]').on('click', function (e) {
            var $form = $(this).closest('form1');
            e.preventDefault();
            $('#confirm').modal({ backdrop: 'static', keyboard: false })
                .one('click', '#delete', function (e) {
                    $form.trigger('submit');
                });
        });

        function DeleteConfirmation() {
            if (confirm("Are you sure you want to delete this record?"))
                return true;
            else
                return false;
        }


        $(function () {
            $('#<%=dgvRoomService.ClientID %>').footable({
                breakpoints: {
                    phone: 480,
                    tablet: 1024,
                    laptop: 1280,
                    smallcomputer: 1360,
                    computer: 1366,
                    bigcomputer: 1920
                },
                filtering: {enabled:true}

            });
        });

            $(document).ready(function(){ $(".notallowAlphabet").keydown(function (e) {
                    if ($.inArray(e.keyCode, [46, 8, 9, 27, 13, 110, 190]) !== -1 || (e.keyCode === 65 && (e.ctrlKey === true || e.metaKey === true)) || (e.keyCode >= 35 && e.keyCode <= 40))
                    {
                        return;
                    }
                    if ((e.shiftKey || (e.keyCode < 48 || e.keyCode > 57)) && (e.keyCode < 96 || e.keycode > 105))
                    {
                        e.preventDefault();
                    }
                });
            });
    </script>

</head>

<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <div class="container maincolor">

            <nav class="navbar navbackground">
                <div class="container-fluid">
                    <div class="navbar-header col-md-4 ">
                        <%--<asp:Image ID="ImageUser" ImageUrl="~/Images/THS.jpg" class="userImage" runat="server" />--%>
                        <asp:Image ID="ImageUser" class="userImage" runat="server" />
                    </div>
                    <div class="container">

                        <div class="navbar-collapse collapse">
                            <div class="col-md-6 headernav">

                                <%-- <div id="menu-button">
                                    <div class="centralizer">
                                        <div class="cursor">
                                            <span class="hide">Menu</span>
                                            <div id="nav-button"><span class="nav-bar"></span><span class="nav-bar"></span><span class="nav-bar"></span></div>
                                            <div id="menu-close-button">&times;</div>
                                        </div>
                                    </div>
                                </div>--%>
                                <%-- <nav id="navigation" style="margin-left: -5px; margin-top: 17px;">--%>

                                <ul class="nav navbar-nav ">
                                    <li class="active"><a href="#">HOME</a></li>
                                    <li><a href="#">ABOUT</a></li>
                                    <li><a href="#">CONTACT US</a></li>
                                </ul>
                                <%--</nav>--%>
                            </div>

                            <div class="col-md-2">
                                <ul class="nav navbar-nav navbar-right">
                                    <li><a href="Login.aspx">Login</a></li>
                                </ul>
                                <div class="container">
                                    <div class="navbar-collapse collapse">
                                        <div id="menu-button">
                                            <div class="centralizer">
                                                <div class="cursor">
                                                    <span class="hide">Menu</span>
                                                    <div id="nav-button"><span class="nav-bar"></span><span class="nav-bar"></span><span class="nav-bar"></span></div>
                                                    <div id="menu-close-button">&times;</div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </nav>

            <ul class="nav nav-tabs tab">
                <li class="active"><a href="#">Room Service</a></li>
            </ul>

            <div class="tab-content tabcontent">

                <div class="row rowtabcontent">
                    <div class="col-md-2 colrow">
                        <asp:Label ID="Label1" runat="server" CssClass="control-label" Text="Title :"></asp:Label>
                    </div>
                    <div class="col-md-4 colrow">
                        <asp:TextBox ID="txtTitle" CssClass="form-control" placeholder="Title" runat="server"></asp:TextBox>

                    </div>
                    <div class="col-md-6 colrow lblfontcolor">
                        <asp:RequiredFieldValidator ID="reqTitle" runat="server" ControlToValidate="txtTitle" ErrorMessage="*** Please enter title!"></asp:RequiredFieldValidator>
                    </div>
                </div>

                <div class="row rowtabcontent">
                    <div class="col-md-2 colrow">
                        <asp:Label ID="Label8" runat="server" CssClass="control-label" Text="Sale/Rent :"></asp:Label>
                    </div>
                    <div class="col-md-6 colrow">
                        <asp:RadioButtonList ID="radioSaleRent" RepeatDirection="Horizontal" runat="server">
                            <asp:ListItem Text="Sale" Value="Sale" />
                            <asp:ListItem Text="Rent" Value="Rent" />
                            <asp:ListItem Text="All" Value="All" />
                        </asp:RadioButtonList>
                    </div>
                    <div class="col-md-4 colrow lblfontcolor">
                        <asp:RequiredFieldValidator ID="reqRadio" runat="server" ControlToValidate="radioSaleRent" ErrorMessage="*** Please Select you want!"></asp:RequiredFieldValidator>
                    </div>
                </div>

                <div class="row rowtabcontent">
                    <div class="col-md-2 colrow">
                        <asp:Label ID="Label9" runat="server" CssClass="control-label" Text="Property Type :"></asp:Label>
                    </div>
                    <div class="col-md-4 colrow">
                        <asp:DropDownList ID="DropDownListPropertyType" CssClass="form-control" runat="server" OnTextChanged="DropDownListPropertyType_TextChanged"></asp:DropDownList>
                    </div>
                    <div class="col-md-6 colrow lblfontcolor">
                        <asp:RequiredFieldValidator ID="reqProperty" runat="server" ControlToValidate="DropDownListPropertyType" ErrorMessage="*** Please Choose Property!"></asp:RequiredFieldValidator>
                    </div>
                </div>

                <div class="row rowtabcontent">
                    <div class="col-md-2 colrow">
                        <asp:Label ID="Label2" runat="server" CssClass="control-label" Text="Area :"></asp:Label>
                    </div>
                    <div class="col-md-2 colrow">
                        <asp:TextBox ID="txtWidth" CssClass="form-control notallowAlphabet" placeholder="Width" runat="server"></asp:TextBox>
                    </div>

                    <div class="col-md-2 colrow">
                        <asp:TextBox ID="txtLength" CssClass="form-control notallowAlphabet" placeholder="Length" runat="server"></asp:TextBox>
                    </div>

                    <div class="col-md-2 colrow">
                        <asp:TextBox ID="txtSqrt" CssClass="form-control notallowAlphabet" placeholder="Sqrt" runat="server"></asp:TextBox>
                    </div>
                    <div class="col-md-4 colrow lblfontcolor">
                    </div>
                </div>

                <div class="row rowtabcontent">
                    <div class="col-md-2 colrow">
                        <asp:Label ID="Label5" runat="server" CssClass="control-label" Text="Floor :"></asp:Label>
                    </div>
                    <div class="col-md-4 colrow">
                        <asp:DropDownList ID="DropDownListFloor" CssClass="form-control" runat="server"></asp:DropDownList>
                    </div>
                    <div class="col-md-6 colrow lblfontcolor">
                        <asp:RequiredFieldValidator ID="rqFloor" runat="server" ControlToValidate="DropDownListFloor" ErrorMessage="*** Please Choose Property!"></asp:RequiredFieldValidator>
                    </div>
                </div>

                <div class="row rowtabcontent">
                    <div class="col-md-2 colrow">
                        <asp:Label ID="LabelCurrenc" runat="server" CssClass="control-label" Text="Currency :"></asp:Label>
                    </div>
                    <div class="col-md-6 colrow">
                        <asp:RadioButtonList ID="radioCurrency" RepeatDirection="Horizontal" runat="server">
                            <asp:ListItem Text="USD" Value="USD" />
                            <asp:ListItem Text="Kyat" Value="Kyat" />
                            <asp:ListItem Text="All" Value="All" />
                        </asp:RadioButtonList>

                    </div>
                    <div class="col-md-4 colrow lblfontcolor">
                        <asp:RequiredFieldValidator ID="reqCurrency" runat="server" ControlToValidate="radioCurrency" ErrorMessage="*** Please Select you want!"></asp:RequiredFieldValidator>
                    </div>
                </div>

                <div class="row rowtabcontent">
                    <div class="col-md-2 colrow">
                        <asp:Label ID="Label4" runat="server" CssClass="control-label" Text="Price :"></asp:Label>
                    </div>
                    <div class="col-md-2 colrow">
                        <asp:TextBox ID="txtPrice" CssClass="form-control notallowAlphabet" placeholder="Price" runat="server"></asp:TextBox>

                    </div>
                    <div class="col-md-8 colrow lblfontcolor">
                        <asp:RequiredFieldValidator ID="reqPrice" runat="server" ControlToValidate="txtPrice" ErrorMessage="*** Please Set Price!"></asp:RequiredFieldValidator>
                    </div>
                </div>

                <div class="row rowtabcontent">
                    <div class="col-md-2 colrow">
                        <asp:Label ID="Label6" runat="server" CssClass="control-label" Text="Decoration :"></asp:Label>
                    </div>
                    <div class="col-md-4 colrow">
                        <asp:DropDownList ID="DropDownListDecoration" CssClass="form-control" runat="server"></asp:DropDownList>
                    </div>
                    <div class="col-md-6 colrow lblfontcolor">
                        <asp:RequiredFieldValidator ID="reqDecoration" runat="server" ControlToValidate="DropDownListDecoration" ErrorMessage="*** Please Choose Decoration!"></asp:RequiredFieldValidator>
                    </div>
                </div>

                <div class="row rowtabcontent">
                    <div class="col-md-2 colrow">
                        <asp:Label ID="Label7" runat="server" CssClass="control-label" Text="Bed Room :"></asp:Label>
                    </div>
                    <div class="col-md-4 colrow">
                        <asp:DropDownList ID="DropDownListBedRoom" CssClass="form-control" runat="server"></asp:DropDownList>
                    </div>
                    <div class="col-md-6 colrow lblfontcolor">
                        <asp:RequiredFieldValidator ID="reqBedRoom" runat="server" ControlToValidate="DropDownListBedRoom" ErrorMessage="*** Please Choose Bed Room!"></asp:RequiredFieldValidator>
                    </div>
                </div>

                <div class="row rowtabcontent">
                    <div class="col-md-2 colrow">
                        <asp:Label ID="Label10" runat="server" CssClass="control-label" Text="Bath Room :"></asp:Label>
                    </div>
                    <div class="col-md-4 colrow">
                        <asp:DropDownList ID="DropDownListBathRoom" CssClass="form-control" runat="server"></asp:DropDownList>
                    </div>
                    <div class="col-md-6 colrow lblfontcolor">
                        <asp:RequiredFieldValidator ID="reqBathRoom" runat="server" ControlToValidate="DropDownListBathRoom" ErrorMessage="*** Please Choose Property!"></asp:RequiredFieldValidator>
                    </div>
                </div>

                <div class="row rowtabcontent">
                    <div class="col-md-2 colrow">
                        <asp:Label ID="Label11" runat="server" CssClass="control-label" Text="City :"></asp:Label>
                    </div>
                    <div class="col-md-4 colrow">
                        <asp:DropDownList ID="DropDownListCity" CssClass="form-control" runat="server" OnSelectedIndexChanged="DropDownListCity_SelectedIndexChanged" OnTextChanged="DropDownListCity_TextChanged"></asp:DropDownList>
                    </div>
                    <div class="col-md-6 colrow lblfontcolor">
                        <asp:RequiredFieldValidator ID="reqCity" runat="server" ControlToValidate="DropDownListCity" ErrorMessage="*** Please Choose City!"></asp:RequiredFieldValidator>
                    </div>
                </div>

                <div class="row rowtabcontent">
                    <div class="col-md-2 colrow">
                        <asp:Label ID="Label12" runat="server" CssClass="control-label" Text="Township :"></asp:Label>
                    </div>
                    <div class="col-md-4 colrow">
                        <asp:DropDownList ID="DropDownListTownship" CssClass="form-control" runat="server"></asp:DropDownList>
                    </div>
                    <div class="col-md-6 colrow lblfontcolor">
                        <asp:RequiredFieldValidator ID="reqTownship" runat="server" ControlToValidate="DropDownListTownship" ErrorMessage="*** Please Choose Township!"></asp:RequiredFieldValidator>
                    </div>
                </div>

                <div class="row rowtabcontent">
                    <div class="col-md-2 colrow">
                        <asp:Label ID="Label13" runat="server" CssClass="control-label" Text="Contact Number :"></asp:Label>
                    </div>
                    <div class="col-md-6 colrow">
                        <asp:TextBox ID="txtContactNumber" CssClass="form-control" placeholder="Contact Number" runat="server"></asp:TextBox>

                    </div>
                    <div class="col-md-4 colrow lblfontcolor">
                        <asp:RequiredFieldValidator ID="reqContactNumber" runat="server" ControlToValidate="txtContactNumber" ErrorMessage="*** Please enter title!"></asp:RequiredFieldValidator>
                    </div>
                </div>


                <div class="row rowtabcontent">
                    <div class="col-md-2 colrow">
                        <asp:Label ID="Label16" runat="server" CssClass="control-label" Text="Detail Information :"></asp:Label>
                    </div>
                    <div class="col-md-8 colrow">
                        <asp:TextBox ID="txtDetailInformation" CssClass="form-control" TextMode="MultiLine" placeholder="Detail Information" runat="server"></asp:TextBox>

                    </div>
                    <div class="col-md-3 colrow lblfontcolor">
                    </div>
                </div>

                <div class="row rowtabcontent">
                    <div class="col-md-2 colrow">

                        <asp:Label ID="Label15" runat="server" CssClass="control-label" Text="Attachment :"></asp:Label>

                    </div>
                    <div class="col-md-2 colrow">
                        <asp:FileUpload ID="fileUpload" AllowMultiple="true" runat="server" />
                        <asp:Label ID="fileLists" Text="" runat="server"></asp:Label>
                    </div>

                    <div class="col-md-2 colrow">
                        <asp:Button ID="btnAdd" runat="server" CausesValidation="false" CssClass="btn btn-sm" Text="Add" OnClick="btnAdd_Click" />
                    </div>
                </div>

                <div class="row rowtabcontent">
                    <div class="col-md-2 colrow">
                    </div>
                    <div class="col-md-2 colrow colrowdivide">
                        <asp:Button ID="btnPost" runat="server" CssClass="btn btn-primary" Text="Post" OnClick="btnPost_Click" />

                    </div>
                    <div class="col-md-2 colrow colrowdivide">
                        <asp:Button ID="btnClear" runat="server" CausesValidation="false" CssClass="btn btn-primary" Text="Clear" OnClick="btnClear_Click" />
                    </div>
                    <div class="col-md-6 colrow">
                    </div>
                </div>

            </div>

            <div class="container maincolor">

                <div class="post-cnt">

                    <div class="row">

                        <div class="col-md-12">
                            <asp:GridView ID="dgvRoomService" runat="server" CellPadding="5" AutoGenerateColumns="False" AllowPaging="True" ViewStateMode="Enabled"
                                BorderColor="Silver"
                                BorderStyle="Solid" BorderWidth="1px" CssClass="footable" data-filter="#filter" EmptyDataText="No Record" Width="100%" OnPageIndexChanging="dgvRoomService_PageIndexChanging" OnSelectedIndexChanged="dgvRoomService_SelectedIndexChanged" AllowSorting="True" OnRowCommand="dgvRoomService_RowCommand" OnRowEditing="dgvRoomService_RowEditing"
                                GridLines="Horizontal">

                                <FooterStyle BackColor="#507CD1" Font-Bold="false" ForeColor="White" />
                                <RowStyle BackColor="#EFF3FB" />
                                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="false" ForeColor="#333333" />
                                <HeaderStyle BackColor="#e2e2e2" Font-Bold="false" ForeColor="White" />
                                <EditRowStyle BackColor="#2461BF" />
                                <AlternatingRowStyle BackColor="White" />
                                <Columns>

                                    <asp:TemplateField HeaderText="ID" Visible="false">
                                        <ItemTemplate>
                                            <asp:Label ID="Label1" Enabled="false" runat="server" Text='<%# Bind("ID") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Title">
                                        <ItemTemplate>
                                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("Title") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Sale/Rent">
                                        <ItemTemplate>
                                            <asp:Label ID="LabelSaleRent" runat="server" Text='<%# Bind("SaleRent") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="PropertyType">
                                        <ItemTemplate>
                                            <asp:Label ID="LabelProperty" runat="server" Text='<%# Bind("PropertyType") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Width">
                                        <ItemTemplate>
                                            <asp:Label ID="LabelWidth" runat="server" Text='<%# Bind("Width") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Length">
                                        <ItemTemplate>
                                            <asp:Label ID="LabelLength" runat="server" Text='<%# Bind("Length") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Sqrt">
                                        <ItemTemplate>
                                            <asp:Label ID="LabelSqrt" runat="server" Text='<%# Bind("Sqrt") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Floor">
                                        <ItemTemplate>
                                            <asp:Label ID="LabelFloor" runat="server" Text='<%# Bind("Floor") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Currency">
                                        <ItemTemplate>
                                            <asp:Label ID="labelCurrency" runat="server" Text='<%# Bind("Currency") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Price">
                                        <ItemTemplate>
                                            <asp:Label ID="LabelPrice" runat="server" Text='<%# Bind("Price") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Decoration">
                                        <ItemTemplate>
                                            <asp:Label ID="LabelDecoration" runat="server" Text='<%# Bind("Decoration") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="BedRoom">
                                        <ItemTemplate>
                                            <asp:Label ID="LabelBedRoom" runat="server" Text='<%# Bind("BedRoom") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="BathRoom">
                                        <ItemTemplate>
                                            <asp:Label ID="LabelBathRoom" runat="server" Text='<%# Bind("BathRoom") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="City">
                                        <ItemTemplate>
                                            <asp:Label ID="LabelCity" runat="server" Text='<%# Bind("City") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Township">
                                        <ItemTemplate>
                                            <asp:Label ID="LabelTownship" runat="server" Text='<%# Bind("Township") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="ContactNumber">
                                        <ItemTemplate>
                                            <asp:Label ID="LabelContact" runat="server" Text='<%# Bind("ContactNumber") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="DetailInformation">
                                        <ItemTemplate>
                                            <asp:Label ID="LabelDetailInfo" runat="server" Text='<%# Bind("DetailInformation") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="File" ItemStyle-Width="120px">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="lkbtnDownload" Style="padding: 2px 4px;" class="btn-sm btn-link" CausesValidation="false" runat="server" Text='<%# Bind("FilePath")%>' CommandName="download" CommandArgument='<%# Eval("FilePath") %>'></asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Action" ItemStyle-Width="120px">
                                        <HeaderStyle Font-Bold="true" />
                                        <ItemStyle Font-Size="Medium" />
                                        <ItemTemplate>
                                            <asp:LinkButton ID="lkbtnEdit" Style="padding: 2px 4px;" class="btn-sm btn-warning" CausesValidation="false" runat="server" Text="Edit" CommandName="edit" CommandArgument='<%# Eval("ID") %>'></asp:LinkButton>
                                            <asp:LinkButton ID="lkbtnCopy" Style="padding: 2px 4px;" class="btn-sm btn-primary " CausesValidation="false" runat="server" Text="Copy" CommandName="copy" CommandArgument='<%# Eval("ID") %>'></asp:LinkButton>
                                            <asp:LinkButton ID="lkbtnDelete" Style="padding: 2px 4px;" class="btn-sm btn-danger" CausesValidation="false" runat="server" Text="Delete" OnClientClick="return DeleteConfirmation()" CommandName="remove" CommandArgument='<%# Eval("ID") %>'></asp:LinkButton>
                                            <asp:HiddenField ID="hfEmpId" runat="server" Value='<%# Eval("ID") %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </div>

                    </div>

                </div>

            </div>

            <div class="panel-footer">
            </div>
        </div>
    </form>
</body>

</html>
