﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Frame.Master" AutoEventWireup="true" CodeBehind="VolumeWeekReport.aspx.cs" Inherits="MobilePOS.VolumeWeekReport" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="margin: 0 auto;width:950px; border-radius:6px; ">
        <div id="panelBox" class="panel panel-info" runat="server">
            <div class="panel-heading">
                <asp:Label ID="lblTitle" runat="server" Text="Volume (Week) Report" Font-Bold="True"></asp:Label>
            </div>
            <div class="panel-body">
                <asp:MultiView ID="mvMain" runat="server" ActiveViewIndex="0">
                    <asp:View ID="vwMain" runat="server">
                        <table>
                            <tr>
                                <td>
                                    <asp:Panel ID="Panel1" runat="server" DefaultButton="btnFilter">
                                        <table width=100%>
                                            <tr>
                                                <td valign="middle" style="padding:10px;">
                                                    DATE START :
                                                    <asp:TextBox ID="tbStart" runat="server" Width="150px" CssClass="date" MaxLength="10" placeholder="yyyy-mm-dd">
                                                    </asp:TextBox>
                                                    &nbsp;&nbsp;&nbsp;
                                                    DATE END :
                                                    <asp:TextBox ID="tbEnd" runat="server" Width="150px" CssClass="date" MaxLength="10" placeholder="yyyy-mm-dd">
                                                    </asp:TextBox>
                                                    Kiosk Name :
                                                    &nbsp;&nbsp;&nbsp;
                                                    <asp:DropDownList ID="ddlKiosk" runat="server" Width="150px">
                                                    </asp:DropDownList>
                                                    &nbsp;&nbsp;&nbsp;
                                                    &nbsp;&nbsp;&nbsp;
                                                    <asp:Button ID="btnFilter" runat="server" Text="Filter" Width="100px" 
                                                        onclick="btnFilter_Click" />
                                                </td>
                                            </tr>
                                        </table>
                                    </asp:Panel>
                                </td>
                            </tr>
                           <tr>
                                <td>
                                    <asp:GridView ID="gvVolumeWeek" runat="server"
                                        GridLines="None"  
                                        AutoGenerateColumns="false"
                                        
                                        AllowPaging="true" PageSize="20"  
                                        CssClass="mGrid"  
                                        PagerStyle-CssClass="pgr"  
                                        AlternatingRowStyle-CssClass="alt" onpageindexchanging="gvVolumeWeek_PageIndexChanging" 
                                        >
                                        <EmptyDataTemplate>No Record(s) found.</EmptyDataTemplate>
                                        <Columns>
                                            <asp:BoundField DataField="ClassName" HeaderStyle-Width="100" HeaderText="Class Name" />
                                            <asp:BoundField DataField="KioskName" HeaderStyle-Width="200" HeaderText="Kiosk Name" />
                                            <asp:BoundField DataField="WeekIn" HeaderStyle-Width="70" HeaderText="Week Index" ItemStyle-HorizontalAlign="Right"/>
                                            <asp:BoundField DataField="ProdName" HeaderStyle-Width="200" HeaderText="Item Name" />
                                            <asp:BoundField DataField="ProdQty" HeaderStyle-Width="60" HeaderText="Item Qty" ItemStyle-HorizontalAlign="Right"/>
                                            <asp:BoundField DataField="StockHeld" HeaderStyle-Width="60" HeaderText="Stock Held" ItemStyle-HorizontalAlign="Right"/>
                                        </Columns>
                                    </asp:GridView>
                                </td>
                           </tr>
                           <tr>
                                <td>
                                    <asp:Button ID="btnExport" runat="server" Text="Export to Excel" 
                                        CssClass="btn btn-primary" onclick="btnExport_Click"   />
                                    
                                </td>
                            </tr>
                        </table>
                    </asp:View>
                </asp:MultiView>
            </div>
        </div>
    </div>
</asp:Content>
