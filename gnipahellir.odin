package gnipa
import "core:fmt"
import m "core:math"
import rl "vendor:raylib"

main :: proc() {
	rl.InitWindow(1000, 1000, "")
	defer rl.CloseWindow()
	rl.SetTargetFPS(60)

	rx: f32 = 600
	ry: f32 = 600
	lx: f32 = 400
	ly: f32 = 600

	flipped := false
	done := false

	for !rl.WindowShouldClose() {
		rx += m.cos(m.to_radians(f32(135)))
		ry -= m.sin(m.to_radians(f32(135)))
		lx += m.cos(m.to_radians(f32(45)))
		ly -= m.sin(m.to_radians(f32(45)))

		rl.BeginDrawing()

		if lx < 600 && done == false {
			rl.DrawCircle(i32(lx), i32(ly), 5, rl.YELLOW)
			rl.DrawCircle(i32(rx), i32(ry), 5, rl.YELLOW)
		} else {
			tly := rx
			tlx := ry

			rx = lx
			ry = ly

			lx = tly
			ly = tlx

			flipped = true
		}

		if flipped == true && lx > 500 {
			done = true

		}


		rl.EndDrawing()
	}
}
