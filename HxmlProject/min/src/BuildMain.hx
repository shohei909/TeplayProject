package;

import teplay.Teplayer;
import common.HtmlWriter;
import common.Config;

class BuildMain {
	
	static public function main() {
		var player = new Teplayer(
			"bin", "resource", 
			{
				title : "title",
				HtmlWriter : HtmlWriter,
				page : Config.page,
				menu : Config.menu,
				scripts : Config.scripts,
				styleSheets : Config.styleSheets,
			}
		);
		
		var articles = player.getArticleList("_internal/article");
		player.addBranch("article", articles);
		player.play();
	}
	
}