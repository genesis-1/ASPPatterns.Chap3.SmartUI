﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="ASPPatterns.Chap3.SmartUI.Web.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:DropDownList ID="ddlDiscountType" runat="server" AutoPostBack="True"
                OnSelectedIndexChanged="ddlDiscountType_SelectedIndexChanged">
                <asp:ListItem Value="0">No Discount</asp:ListItem>
                <asp:ListItem Value="1">Trade Discount</asp:ListItem>
            </asp:DropDownList>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                DataKeyNames="ProductId" 
                DataSourceID="SqlDataSource1" 
                EmptyDataText="There are no data records to display."
                OnRowDataBound="GridView1_RowDataBound">
                <Columns>
                    <asp:BoundField DataField="ProductId" HeaderText="ProductId" ReadOnly="True" SortExpression="ProductId" />
                    <asp:BoundField DataField="ProductName" HeaderText="ProductName" SortExpression="ProductName" />
                    <asp:BoundField DataField="RRP" HeaderText="RRP" SortExpression="RRP" />
                    <asp:BoundField DataField="sellingPrice" HeaderText="sellingPrice" SortExpression="sellingPrice" />
                    <asp:TemplateField HeaderText="SellingPrice" SortExpression="SellingPrice">
                        <ItemTemplate>
                            <asp:Label ID="lblSellingPrice" runat="server"
                   Text='<%# Bind("SellingPrice") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Discount">
                        <ItemTemplate>
                            <asp:Label runat="server" ID="lblDiscount"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Savings">
                        <ItemTemplate>
                            <asp:Label runat="server" ID="lblSavings"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ShopConnectionString1 %>" DeleteCommand="DELETE FROM [Products] WHERE [ProductId] = @ProductId" InsertCommand="INSERT INTO [Products] ([ProductName], [RRP], [sellingPrice]) VALUES (@ProductName, @RRP, @sellingPrice)" ProviderName="<%$ ConnectionStrings:ShopConnectionString1.ProviderName %>" SelectCommand="SELECT [ProductId], [ProductName], [RRP], [sellingPrice] FROM [Products]" UpdateCommand="UPDATE [Products] SET [ProductName] = @ProductName, [RRP] = @RRP, [sellingPrice] = @sellingPrice WHERE [ProductId] = @ProductId">
                <DeleteParameters>
                    <asp:Parameter Name="ProductId" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="ProductName" Type="String" />
                    <asp:Parameter Name="RRP" Type="Decimal" />
                    <asp:Parameter Name="sellingPrice" Type="Decimal" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="ProductName" Type="String" />
                    <asp:Parameter Name="RRP" Type="Decimal" />
                    <asp:Parameter Name="sellingPrice" Type="Decimal" />
                    <asp:Parameter Name="ProductId" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
