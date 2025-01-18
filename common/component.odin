package common

import "core:fmt"

position_storage := [MAX_ENTITY_SIZE]Position{}
health_storage := [MAX_ENTITY_SIZE]Health{}

Component :: union {
    Position,
    Health,
}

Position :: struct {
    x: f32,
    y: f32,
}

Health :: struct {
    value: u32,
}

add_component :: proc(entity: Entity, component: Component) {
    switch c in component {
    case Position:
        position_storage[entity] = component.(Position)
    case Health:
        health_storage[entity] = component.(Health)
    }
}

get_component :: proc(entity: Entity, $T: typeid) -> ^T {
    if T == typeid_of(Health) {
        return cast(^T)&health_storage[entity]
    } else if T == typeid_of(Position) {
        return cast(^T)&position_storage[entity]
    } else {
        fmt.println("unknown type", type_info_of(T))
        return nil
    }
}

main :: proc() {
    fmt.println(MAX_ENTITY_SIZE)
    x := create_entity()
    add_component(x, Position{1, 2})
    a := get_component(x, Health)
    b := get_component(x, Position)
    fmt.println(a, b)
}
