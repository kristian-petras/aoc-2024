package tino

import rl "vendor:raylib"

Entity :: struct {
    x: u32,
    y: u32,
}

main :: proc() {
    rl.InitWindow(600, 600, "tinko")
    rl.SetTargetFPS(60)

    for !rl.WindowShouldClose() {
        input()
        process()

        rl.BeginDrawing()
        rl.ClearBackground(rl.BLUE)
        draw()
        rl.EndDrawing()
    }

    rl.CloseWindow()
}

input :: proc() {

}

process :: proc() {

}

draw :: proc() {

}
