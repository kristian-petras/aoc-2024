package client

import rl "vendor:raylib"

World :: struct {
    scenes: []Scene,
}

Scene :: struct {
    entities: []Entity,
}

Input :: struct {
    up:    bool,
    down:  bool,
    left:  bool,
    right: bool,
}

Test :: struct {
    color: rl.Color,
}

main :: proc() {
    rl.InitWindow(600, 600, "tinko")
    rl.SetTargetFPS(60)

    world := World{}
    for !rl.WindowShouldClose() {
        input := input()
        process(&world, input, rl.GetFrameTime())

        rl.BeginDrawing()
        rl.ClearBackground(rl.BLUE)
        draw(&world)
        rl.EndDrawing()
    }

    rl.CloseWindow()
}

input :: proc() -> Input {
    return {
        up = rl.IsKeyDown(.W),
        down = rl.IsKeyDown(.S),
        left = rl.IsKeyDown(.A),
        right = rl.IsKeyDown(.D),
    }
}

process :: proc(world: ^World, input: Input, delta: f32) {
    if input.up {
        world.player.y -= 400 * delta
    }
    if input.down {
        world.player.y += 400 * delta
    }
    if input.left {
        world.player.x -= 400 * delta
    }
    if input.right {
        world.player.x += 400 * delta
    }
}

draw :: proc(world: ^World) {
    rl.DrawRectangle(
        i32(world.player.x),
        i32(world.player.y),
        100,
        100,
        rl.GREEN,
    )
}
