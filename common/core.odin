package common

MAX_ENTITY_SIZE :: 64

Entity :: distinct u32

entity_index: Entity = 0

create_entity :: proc() -> Entity {
    assert(entity_index <= MAX_ENTITY_SIZE, "max entity size exceeded.")
    entity_index += 1
    return entity_index
}

remove_entity :: proc() {}
