//  
//  Copyright (C) 2011 Robert Dyer, Rico Tzschichholz
// 
//  This program is free software: you can redistribute it and/or modify
//  it under the terms of the GNU General Public License as published by
//  the Free Software Foundation, either version 3 of the License, or
//  (at your option) any later version.
// 
//  This program is distributed in the hope that it will be useful,
//  but WITHOUT ANY WARRANTY; without even the implied warranty of
//  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//  GNU General Public License for more details.
// 
//  You should have received a copy of the GNU General Public License
//  along with this program.  If not, see <http://www.gnu.org/licenses/>.
// 

using Cairo;
using Gdk;
using Gtk;

using Plank.Services;

namespace Plank.Drawing
{
	public class ThemeRenderer : Preferences
	{
		[Description(nick = "top-roundness", blurb = "The roundness of the top corners.")]
		public int TopRoundness { get; set; default = 6; }
		
		[Description(nick = "bottom-roundness", blurb = "The roundness of the bottom corners.")]
		public int BottomRoundness { get; set; default = 6; }
		
		[Description(nick = "line-width", blurb = "The thickness (in pixels) of lines drawn.")]
		public int LineWidth { get; set; default = 1; }
		
		[Description(nick = "outer-stroke-color", blurb = "The color (RGBA) of the outer stroke.")]
		public Color OuterStrokeColor { get; set; }
		
		[Description(nick = "fill-start-color", blurb = "The starting color (RGBA) of the fill gradient.")]
		public Color FillStartColor { get; set; }
		
		[Description(nick = "fill-end-color", blurb = "The ending color (RGBA) of the fill gradient.")]
		public Color FillEndColor { get; set; }
		
		[Description(nick = "inner-stroke-color", blurb = "The color (RGBA) of the inner stroke.")]
		public Color InnerStrokeColor { get; set; }
		
		construct
		{
			OuterStrokeColor = new Color (0.1647, 0.1647, 0.1647, 1);
			FillStartColor = new Color (0.1647, 0.1647, 0.1647, 1);
			FillEndColor = new Color (0.3176, 0.3176, 0.3176, 1);
			InnerStrokeColor = new Color (1, 1, 1, 1);
		}
		
		public ThemeRenderer ()
		{
			base ();
		}
		
		public void load (string type)
		{
			init_from_file ("theme/" + type + ".theme");
		}
		
		public int get_top_offset ()
		{
			return TopRoundness > 0 ? LineWidth : 0;
		}
		
		public int get_bottom_offset ()
		{
			return BottomRoundness > 0 ? LineWidth : 0;
		}
		
		public void draw_background (DockSurface surface)
		{
			var cr = surface.Context;
			
			var top_offset = get_top_offset ();
			var bottom_offset = get_bottom_offset ();
			
			var gradient = new Pattern.linear (0, 0, 0, surface.Height);
			gradient.add_color_stop_rgba (0, FillStartColor.R, FillStartColor.G, FillStartColor.B, FillStartColor.A);
			gradient.add_color_stop_rgba (1, FillEndColor.R, FillEndColor.G, FillEndColor.B, FillEndColor.A);
			
			cr.save ();
			cr.set_source (gradient);
			
			draw_rounded_rect (cr,
				LineWidth / 2.0,
				top_offset / 2.0,
				surface.Width - LineWidth,
				surface.Height - top_offset / 2.0 - bottom_offset / 2.0,
				TopRoundness,
				BottomRoundness);
			cr.fill_preserve ();
			cr.restore ();
			
			cr.set_source_rgba (OuterStrokeColor.R, OuterStrokeColor.G, OuterStrokeColor.B, OuterStrokeColor.A);
			cr.set_line_width (LineWidth);
			cr.stroke ();
			
			gradient = new Pattern.linear (0, top_offset,
				0, surface.Height - top_offset - bottom_offset);
			
			gradient.add_color_stop_rgba (0, InnerStrokeColor.R, InnerStrokeColor.G, InnerStrokeColor.B, 0.5);
			gradient.add_color_stop_rgba ((TopRoundness > 0 ? TopRoundness : LineWidth) / (double) surface.Height, InnerStrokeColor.R, InnerStrokeColor.G, InnerStrokeColor.B, 0.12);
			gradient.add_color_stop_rgba ((surface.Height - (BottomRoundness > 0 ? BottomRoundness : LineWidth)) / (double) surface.Height, InnerStrokeColor.R, InnerStrokeColor.G, InnerStrokeColor.B, 0.08);
			gradient.add_color_stop_rgba (1, InnerStrokeColor.R, InnerStrokeColor.G, InnerStrokeColor.B, 0.19);
			
			cr.save ();
			cr.set_source (gradient);
			
			draw_inner_rect (cr, surface);
			cr.set_line_width (LineWidth);
			cr.stroke ();
			cr.restore ();
		}
		
		public void draw_inner_rect (Context cr, DockSurface surface)
		{
			var top_offset = get_top_offset ();
			var bottom_offset = get_bottom_offset ();
			
			draw_rounded_rect (cr,
				3 * LineWidth / 2.0,
				3 * top_offset / 2.0,
				surface.Width - 3 * LineWidth,
				surface.Height - 3 * top_offset / 2.0 - 3 * bottom_offset / 2.0,
				TopRoundness,
				BottomRoundness);
		}
		
		void draw_rounded_rect (Context cr, double x, double y, double width, double height, double top_radius = 6.0, double bottom_radius = 6.0)
		{
			top_radius = double.min (top_radius, double.min (width, height));
			bottom_radius = double.min (bottom_radius, double.min (width, height) - top_radius);
			
			cr.move_to (x + top_radius, y);
			cr.arc (x + width - top_radius, y + top_radius, top_radius, Math.PI * 1.5, Math.PI * 2.0);
			cr.arc (x + width - bottom_radius, y + height - bottom_radius, bottom_radius, 0, Math.PI * 0.5);
			cr.arc (x + bottom_radius, y + height - bottom_radius, bottom_radius, Math.PI * 0.5, Math.PI);
			cr.arc (x + top_radius, y + top_radius, top_radius, Math.PI, Math.PI * 1.5);
		}
		
		protected override void verify (string prop)
		{
			base.verify (prop);
			
			switch (prop) {
			case "TopRoundness":
				if (TopRoundness < 0)
					TopRoundness = 0;
				break;
			
			case "BottomRoundness":
				if (BottomRoundness < 0)
					BottomRoundness = 0;
				break;
			
			case "LineWidth":
				if (LineWidth < 0)
					LineWidth = 0;
				break;
			}
		}
	}
}