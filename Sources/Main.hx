package;

import kha.input.Mouse;
import kha.Assets;
import kha.Framebuffer;
import kha.System;

class Main {
	static var repeats = 370; // Works when 374, fails when 375
	// static var repeats = 375; // Works when 374, fails when 375
	static var image:kha.Image;
	static function render(framebuffer: Framebuffer): Void {
		framebuffer.g2.begin();
		trace(repeats);
		for (x in 0...repeats) {
			// framebuffer.g2.drawScaledImage(kha.Assets.images.sand,(x%10)*10,Math.floor(x/10)*10,8,8);
			framebuffer.g2.drawScaledImage(kha.Assets.images.sand,(x%20)*10,Math.floor(x/20)*10,8,8);
		}
		// framebuffer.g2.drawImage(image,200,0);
		// framebuffer.g2.drawImage(kha.Assets.images.sand,200,0);
		
		if (false) {
			framebuffer.g2.end();
			framebuffer.g2.begin(false);
		}
		
		framebuffer.g2.drawImage(kha.Assets.images.water,200,0);
		// framebuffer.g2.drawImage(kha.Assets.images.water,200,200);
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
				
				Mouse.get().notify(null,null,null,function(delta) {
					repeats += delta;
				});
				
				System.notifyOnFrames(function (framebuffers) { render(framebuffers[0]); });
			});
		});
	}
}
