package gnipa
import "core:fmt"
import m "core:math"
import rl "vendor:raylib"

line_points_r: [dynamic]rl.Vector2
line_points_l: [dynamic]rl.Vector2

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

	gem: f32 = 0.01
	for !rl.WindowShouldClose() {
		rx += m.cos(m.to_radians(f32(135)))
		ry -= m.sin(m.to_radians(f32(135)))
		lx += m.cos(m.to_radians(f32(45)))
		ly -= m.sin(m.to_radians(f32(45)))

		rl.BeginDrawing()
		gem += 0.01
		col := m.sin_f32(gem) * 255
		if lx < 600 && done == false {

			append(&line_points_l, rl.Vector2{lx, ly})
			append(&line_points_r, rl.Vector2{rx, ry})

			rl.DrawCircle(i32(lx), i32(ly), 5, rl.ColorFromHSV(col, 1, 1))
			rl.DrawCircle(i32(rx), i32(ry), 5, rl.ColorFromHSV(col, 1, 1))
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

		for l_point, c in line_points_l {
			if c < len(line_points_l) - 1 {
				rl.DrawLineV(l_point, line_points_l[c + 1], rl.YELLOW)
			}
		}

		for r_point, c in line_points_r {
			if c < len(line_points_r) - 1 {
				rl.DrawLineV(r_point, line_points_r[c + 1], rl.YELLOW)
			}

		}


		rl.EndDrawing()
	}
}
