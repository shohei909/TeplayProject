package;

import teplay.Teplayer;
import teplay.plugin.PygmentsPlugin;
import teplay.plugin.RedcarpetPlugin;
import teplay.plugin.SassPlugin;
import common.HtmlWriter;
import common.Config;

class BuildMain {
	
	static public var pythonDir				= "C:\\Python34"; // input your python home
	static public var rubyDir				= "C:\\Ruby193"; // input your ruby home
	static public var redcarpetArgs 		= ["--render-hard-wrap", "--render-xhtml", "--parse-fenced-code-blocks", "--parse-tables"];
	static public var sassArgs				= ["--style", "compressed", "--no-cache", "--trace"];
	
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
		
		player.addPlugin(new RedcarpetPlugin(rubyDir, redcarpetArgs));
		player.addPlugin(new SassPlugin(rubyDir, sassArgs));
		player.addPlugin(new PygmentsPlugin(pythonDir));
		
		player.play();
	}
	
}