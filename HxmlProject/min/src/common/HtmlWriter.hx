package common;

class HtmlWriter {
	
	static public function script( file:String ) {
		return '<script type="text/javascript" src="$file"></script>';
	}
	
	static public function styleSheet( file:String ) {
		return '<link rel="stylesheet" type="text/css" href="$file" />';
	}

	static public function title (title:String, ?subTitle:String) {
		return if (subTitle == null) title else subTitle + " | " + title;
	}
	
	static public function menu(dir:String, currentPage:String) {
		function cell(page) {
			var title = Reflect.field(Config.page, page).title;
			
			if (page == currentPage) {
				return '<div class="main_menu_item active">$title</div>';
			} else {
				return '<div class="main_menu_item"><a href="$dir$page.html">$title</a></div>';
			}
		}
		
		var cells = [for (page in Config.menu) cell(page)].join("");
		return '<div id="main_menu">$cells</div>';
	}
	
}