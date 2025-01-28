/* DbusmenuGtk-0.4.vapi generated by vapigen, do not modify. */

[CCode (cprefix = "DbusmenuGtk", gir_namespace = "DbusmenuGtk", gir_version = "0.4", lower_case_cprefix = "dbusmenu_")]
namespace DbusmenuGtk {
	[CCode (cheader_filename = "libdbusmenu-gtk/client.h,libdbusmenu-gtk/dbusmenu-gtk.h,libdbusmenu-gtk/menu.h,libdbusmenu-gtk/menuitem.h,libdbusmenu-gtk/parser.h", lower_case_csuffix = "gtkclient", type_id = "dbusmenu_gtkclient_get_type ()")]
	public class Client : Dbusmenu.Client {
		[CCode (has_construct_function = false)]
		public Client (string dbus_name, string dbus_object);
		public unowned Gtk.AccelGroup get_accel_group ();
		public unowned Gtk.MenuItem menuitem_get (Dbusmenu.Menuitem item);
		public unowned Gtk.Menu menuitem_get_submenu (Dbusmenu.Menuitem item);
		public void newitem_base (Dbusmenu.Menuitem item, Gtk.MenuItem gmi, Dbusmenu.Menuitem parent);
		public void set_accel_group (Gtk.AccelGroup agroup);
	}
	[CCode (cheader_filename = "libdbusmenu-gtk/client.h,libdbusmenu-gtk/dbusmenu-gtk.h,libdbusmenu-gtk/menu.h,libdbusmenu-gtk/menuitem.h,libdbusmenu-gtk/parser.h", lower_case_csuffix = "gtkmenu", type_id = "dbusmenu_gtkmenu_get_type ()")]
	public class Menu : Gtk.Menu, Atk.Implementor, Gtk.Buildable {
		[CCode (has_construct_function = false)]
		public Menu (string dbus_name, string dbus_object);
		public unowned DbusmenuGtk.Client get_client ();
		[NoAccessorMethod]
		public string dbus_name { owned get; construct; }
		[NoAccessorMethod]
		public string dbus_object { owned get; construct; }
	}
	[CCode (cheader_filename = "libdbusmenu-gtk/client.h,libdbusmenu-gtk/dbusmenu-gtk.h,libdbusmenu-gtk/menu.h,libdbusmenu-gtk/menuitem.h,libdbusmenu-gtk/parser.h", cname = "DBUSMENU_GTK_MENUITEM_H__")]
	public const int GTK_MENUITEM_H__;
	[CCode (cheader_filename = "libdbusmenu-gtk/client.h,libdbusmenu-gtk/dbusmenu-gtk.h,libdbusmenu-gtk/menu.h,libdbusmenu-gtk/menuitem.h,libdbusmenu-gtk/parser.h")]
	public static unowned Dbusmenu.Menuitem gtk_parse_get_cached_item (Gtk.Widget widget);
	[CCode (cheader_filename = "libdbusmenu-gtk/client.h,libdbusmenu-gtk/dbusmenu-gtk.h,libdbusmenu-gtk/menu.h,libdbusmenu-gtk/menuitem.h,libdbusmenu-gtk/parser.h")]
	public static Dbusmenu.Menuitem gtk_parse_menu_structure (Gtk.Widget widget);
	[CCode (cheader_filename = "libdbusmenu-gtk/client.h,libdbusmenu-gtk/dbusmenu-gtk.h,libdbusmenu-gtk/menu.h,libdbusmenu-gtk/menuitem.h,libdbusmenu-gtk/parser.h")]
	public static Gdk.Pixbuf menuitem_property_get_image (Dbusmenu.Menuitem menuitem, string property);
	[CCode (cheader_filename = "libdbusmenu-gtk/client.h,libdbusmenu-gtk/dbusmenu-gtk.h,libdbusmenu-gtk/menu.h,libdbusmenu-gtk/menuitem.h,libdbusmenu-gtk/parser.h")]
	public static void menuitem_property_get_shortcut (Dbusmenu.Menuitem menuitem, out uint key, out Gdk.ModifierType modifier);
	[CCode (cheader_filename = "libdbusmenu-gtk/client.h,libdbusmenu-gtk/dbusmenu-gtk.h,libdbusmenu-gtk/menu.h,libdbusmenu-gtk/menuitem.h,libdbusmenu-gtk/parser.h")]
	public static bool menuitem_property_set_image (Dbusmenu.Menuitem menuitem, string property, Gdk.Pixbuf data);
	[CCode (cheader_filename = "libdbusmenu-gtk/client.h,libdbusmenu-gtk/dbusmenu-gtk.h,libdbusmenu-gtk/menu.h,libdbusmenu-gtk/menuitem.h,libdbusmenu-gtk/parser.h")]
	public static bool menuitem_property_set_shortcut (Dbusmenu.Menuitem menuitem, uint key, Gdk.ModifierType modifier);
	[CCode (cheader_filename = "libdbusmenu-gtk/client.h,libdbusmenu-gtk/dbusmenu-gtk.h,libdbusmenu-gtk/menu.h,libdbusmenu-gtk/menuitem.h,libdbusmenu-gtk/parser.h")]
	public static bool menuitem_property_set_shortcut_menuitem (Dbusmenu.Menuitem menuitem, Gtk.MenuItem gmi);
	[CCode (cheader_filename = "libdbusmenu-gtk/client.h,libdbusmenu-gtk/dbusmenu-gtk.h,libdbusmenu-gtk/menu.h,libdbusmenu-gtk/menuitem.h,libdbusmenu-gtk/parser.h")]
	public static bool menuitem_property_set_shortcut_string (Dbusmenu.Menuitem menuitem, string shortcut);
}
