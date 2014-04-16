<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="IndexEdit.aspx.cs" ViewStateMode="Disabled" Inherits="AlbumSamling.Pages.IndexEdit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
       
    <h1>
        Redigera kund
    </h1>
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" CssClass="validation-summary-errors" />
    <asp:FormView ID="CustomerFormView" runat="server"
        ItemType="AlbumSamling.Model.CustomerProp"
        DataKeyNames="CustomerId"
        DefaultMode="Edit"
        RenderOuterTable="false"
        SelectMethod="CustomerFormView_GetData"
        UpdateMethod="CustomerFormView_UpdateItem">
        <EditItemTemplate>
            <div class="editor-label">
                <label for="Förnamn">Förnamn</label>
            </div>
            <div class="editor-field">
                <asp:TextBox ID="Förnamn" runat="server" Text='<%# BindItem.Förnamn %>' />
            </div>
            <div class="editor-label">
                <label for="Efternamn">Efternamn</label>
            </div>
            <div class="editor-field">
                <asp:TextBox ID="Efternamn" runat="server" Text='<%# BindItem.Efternamn %>' />
            </div>
            <div class="editor-label">
                <label for="Ort">Ort</label>
            </div>
            <div class="editor-field">
                <asp:TextBox ID="Ort" runat="server" Text='<%# BindItem.Ort %>' />
            </div>
            <div>
                <asp:LinkButton ID="LinkButton1" runat="server" Text="Spara" CommandName="Update" />
                <asp:HyperLink ID="HyperLink1" runat="server" Text="Avbryt" NavigateUrl='<%# GetRouteUrl("Index", new { id = Item.CustomerId }) %>' />
            </div>
        </EditItemTemplate>
    </asp:FormView>
    </form>
</body>
</html>
