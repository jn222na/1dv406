<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Album.aspx.cs" ViewStateMode="Disabled" Inherits="AlbumSamling.Pages.Album" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            
            <asp:Label runat="server" ID="AlbumStatuslabel" Visible="false" Text=""></asp:Label>
            <asp:ListView ID="AlbumListView1" runat="server"
                ItemType="AlbumSamling.Model.AlbumProp"
                SelectMethod="AlbumListView_GetData"
                DeleteMethod="AlbumListView_DeleteItem"
                InsertMethod="AlbumFormView_InsertItem"
                InsertItemPosition="FirstItem"
                DataKeyNames="AlbumId">
                <LayoutTemplate>

                    <table>
                        <tr>
                            <th>Förnamn
                            </th>
                            <th>Efternamn
                            </th>
                            <th>Ort
                            </th>
                            <th runat="server" id="itemPlaceholder">Ort
                            </th>
                        </tr>
                    </table>
                </LayoutTemplate>
                <ItemTemplate>
                    <tr>
                        <td>
                            <%#: Item.AlbumTitel %>
                        </td>
                        <td>
                            <%#: Item.ArtistTitel %>
                        </td>
                        <td>
                            <%#: Item.Utgivningsår %>
                        </td>
                        <td>
                            <asp:HyperLink ID="HyperLink1" NavigateUrl='<%# GetRouteUrl("AlbumEditRoute", new {AlbumID = Item.AlbumID}) %>' runat="server">Redigera</asp:HyperLink>
                        </td>
                        <td>
                            <asp:LinkButton ID="Delete" CommandName="Delete" runat="server" Text="Ta Bort" OnClientClick='<%# String.Format("return confirm(\"Ta bort Albumet {0}?\")", Item.AlbumTitel) %>'></asp:LinkButton>
                        </td>
                    </tr>
                </ItemTemplate>

                <EmptyDataTemplate>
                    <%-- Detta visas då kunder saknas i databasen. --%>
                    <p>
                        Kunder saknas.
                    </p>
                </EmptyDataTemplate>

                 <InsertItemTemplate>
                    <tr>
                        
                        <td>
                            <asp:TextBox ID="AlbumTitel" runat="server" Text='<%# BindItem.AlbumTitel %>' MaxLength="50" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                ErrorMessage="AlbumTitel måste anges" 
                                ControlToValidate="AlbumTitel" ValidationGroup="Insert" Display="None" >

                            </asp:RequiredFieldValidator>
                        </td>
                        <td>
                            <asp:TextBox ID="ArtistTitel" runat="server" Text='<%# BindItem.ArtistTitel %>'  MaxLength="50"/>
                             <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                 ErrorMessage="ArtistTitel måste anges" 
                                ControlToValidate="ArtistTitel" ValidationGroup="Insert" Display="None" >
                                 </asp:RequiredFieldValidator>
                        </td>
                        <td>
                            <asp:TextBox ID="Utgivningsår" runat="server" Text='<%# BindItem.Utgivningsår %>' MaxLength="50" />
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                                ErrorMessage="Utgivningsår måste anges" 
                                ControlToValidate="Utgivningsår" ValidationGroup="Insert" Display="None"  >
                            </asp:RegularExpressionValidator>
                        </td>
                        <td>
                            <asp:LinkButton ID="Insert" runat="server" CommandName="Insert" Text="Lägg till"  />
                            <asp:LinkButton ID="Cancel" runat="server" CommandName="Cancel" Text="Rensa" CausesValidation="false" />
                        </td>
                    </tr>
                </InsertItemTemplate>
            </asp:ListView>

        </div>
    </form>
</body>
</html>
