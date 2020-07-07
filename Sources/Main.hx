package;

import kha.Assets;
import kha.Framebuffer;
import kha.System;

class Main {
	static var repeats = 375; // Works when 374, fails when 375
	static var image:kha.Image;
	static function render(framebuffer: Framebuffer): Void {
		framebuffer.g2.begin();
		for (x in 0...repeats) {
			framebuffer.g2.drawImage(kha.Assets.images.sand,x*256,0);
		}
		framebuffer.g2.drawImage(image,0,0);
		framebuffer.g2.end();
	}
	
	public static function main() {
		System.start({title: "Kha", width: 800, height: 600}, function (_) {
			Assets.loadEverything(function () {
				
				image = kha.Image.createRenderTarget(256,256);
				var g = image.g2;
				g.begin(true, kha.Color.Purple);
				g.color = kha.Color.Red;
				g.fillRect(20,20,50,50);
				g.end();
				
				System.notifyOnFrames(function (framebuffers) { render(framebuffers[0]); });
			});
		});
	}
}
