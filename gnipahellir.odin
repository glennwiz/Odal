package gnipa

import "core:fmt"
import m "core:math"
import rl "vendor:raylib"

main :: proc() {

	rl.InitWindow(1000, 1000, "")
	defer rl.CloseWindow()

	rl.SetTargetFPS(60)

	for !rl.WindowShouldClose() {
		rl.BeginDrawing()
		rl.DrawCircle(500, 500, 5, rl.YELLOW)
		rl.EndDrawing()
	}
}
