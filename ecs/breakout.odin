package ecs


SystemType :: enum {
    Startup,
    Update,
    FixedUpdate,
    Teardown
}

Universe :: struct {
    
}

init_universe :: proc() -> Universe {
    return {}
}

register_resource :: proc(universe: ^Universe, e: $T) {

}

register_system :: proc(universe: ^Universe, system_type: SystemType, system: proc(universe: ^Universe)) {

}

create_entity :: proc(universe: ^Universe, component: $T) {

}

get_resource:: proc(universe: ^Universe, $T: typeid) -> ^T {
    return nil
}

setup :: proc(universe: ^Universe) {
    create_entity(universe, "player")
    create_entity(universe, 123)

    register_resource(universe, Score{0})
    register_resource(universe, Color{255, 0, 0, 255})




}

get_entities :: proc {
    get_entities_1,
    get_entities_2
}

get_entities_1 :: proc(universe: ^Universe, $T: typeid) -> ^T {
    return nil, nil
}

get_entities_2 :: proc(universe: ^Universe, $T1: typeid, $T2: typeid) -> ([]T1, []T2) {
    return nil, nil
}

apply_velocity :: proc(universe: ^Universe) {
    time := get_resource(universe, Time)
    transform, velocity := get_entities(universe, Transform, Velocity)
    
    entities := soa_zip(transform, velocity)

    for t, v in entities {
        t.x += v.x * time.delta
        t.y += v.y * time.delta
    }
    
}


main :: proc() {
    universe := init_universe()

    register_system(&universe, .Startup, setup)
    register_system(&universe, .FixedUpdate, apply_velocity)
}

Score :: struct {
    value : u32,
}

Color :: struct {
    r : u8,
    g : u8,
    b : u8,
    a : u8,
}

Time :: struct {
    
}

Transform :: struct {

}

Velocity :: struct {}