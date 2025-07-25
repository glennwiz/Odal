package gnipa
import "core:fmt"
import m "core:math"
import rl "vendor:raylib"

main :: proc() {
	rl.InitWindow(1000, 1000, "")
	defer rl.CloseWindow()
	rl.SetTargetFPS(60)

	lx: f32 = 400
	ly: f32 = 600
	rx: f32 = 600
	ry: f32 = 600

	for !rl.WindowShouldClose() {
		lx += m.cos(m.to_radians(f32(45)))
		ly -= m.sin(m.to_radians(f32(45)))
		rx += m.cos(m.to_radians(f32(135)))
		ry -= m.sin(m.to_radians(f32(135)))

		rl.BeginDrawing()

		if lx < 600 {
			rl.DrawCircle(i32(lx), i32(ly), 5, rl.YELLOW)
			rl.DrawCircle(i32(rx), i32(ry), 5, rl.YELLOW)

		}
		rl.EndDrawing()
	}
}
