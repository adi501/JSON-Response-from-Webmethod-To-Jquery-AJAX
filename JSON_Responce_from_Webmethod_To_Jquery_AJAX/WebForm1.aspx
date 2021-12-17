<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="JSON_Responce_from_Webmethod_To_Jquery_AJAX.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="Jquery/jquery-3.6.0.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Button ID="btnGetDetails" runat="server" Text="Get Details" />
            <table>
                <tr>
                    <td>Product Name:</td>
                    <td>
                        <asp:DropDownList ID="ddlProductName" runat="server">
                            <asp:ListItem Text="Select" Value="Select"></asp:ListItem>
                            <asp:ListItem Text="oneplus nord" Value="oneplus nord"></asp:ListItem>
                            <asp:ListItem Text="Vivo" Value="Vivo"></asp:ListItem>
                            <asp:ListItem Text="Moto" Value="Moto"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td>Amount:</td>
                    <td>
                        <input id="txtAmount" runat="server" type="text" />
                    </td>
                </tr>
                <tr>
                    <td>Manufacturing Year:</td>
                    <td>
                        <asp:TextBox ID="txtManufacturing_year" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>Manufacturing Month:</td>
                    <td>
                        <asp:TextBox ID="txtManufacturing_month" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>Color:</td>
                    <td>
                        <asp:TextBox ID="txtColor" runat="server"></asp:TextBox>
                    </td>
                </tr>
            </table>

            <script type="text/javascript">
                $('#btnGetDetails').click(function (e) {
                    e.preventDefault();
                    //alert($("#DropDownList1 option:selected").text());
                    //var postData = {
                    //    'selectedData': $("#DropDownList1 option:selected").text()
                    //};
                    $.ajax({
                        type: "POST",
                        url: "/WebForm1.aspx/getProductDetails",
                        // data: JSON.stringify(postData),
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (r) {
                            $("#ddlProductName").val(r.d.product_name);
                            $('#txtAmount').val(r.d.product_details.amount);
                            $('#txtManufacturing_year').val(r.d.product_details.manufacturing_year);
                            $('#txtManufacturing_month').val(r.d.product_details.manufacturing_month);
                            $('#txtColor').val(r.d.product_details.color);
                            console.log(r.d.product_details);
                        }
                    });
                });
            </script>
        </div>
    </form>
</body>
</html>
