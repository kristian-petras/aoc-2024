package ecs

// import "core:fmt"

// MAX_ENTITY_SIZE :: 64

// Entity :: distinct u32

// ArchetypeId :: distinct u32

// ComponentId :: distinct u32

// entity_index: Entity = 0

// Archetype :: struct {}

// archetype_mapping: map[ArchetypeId][dynamic]Archetype = {}

// component_index: ComponentId = 0
// component_mapping: map[typeid]ComponentId = {}

// create_entity :: proc() -> Entity {
//     assert(entity_index <= MAX_ENTITY_SIZE, "max entity size exceeded.")
//     entity_index += 1
//     return entity_index
// }

// // TODO
// remove_entity :: proc() {}

// // private?
// register_component :: proc($T: typeid) -> ComponentId {
//     value, ok := &component_mapping[T]
//     if !ok {
//         value^ = component_index
//         component_index <<= 1
//         return component_index
//     }
//     return value^
// }

// // private
// get_archetype_id :: proc(component_ids: ..ComponentId) -> ArchetypeId {
//     archetype_id: ComponentId = 0
//     for c in component_ids {
//         archetype_id |= c
//     }
//     return ArchetypeId(archetype_id)
// }

// register_archetype :: proc(
//     component_ids: ..ComponentId,
// ) -> (
//     id: ArchetypeId,
//     archetype: []Archetype,
// ) {
//     archetype_id := get_archetype_id(..component_ids)
//     value, ok := &archetype_mapping[archetype_id]
//     if !ok {
//         value^ = {}
//     }
//     return archetype_id, value*
// }

// // position_storage := [MAX_ENTITY_SIZE]Position{}
// // health_storage := [MAX_ENTITY_SIZE]Health{}

// // add_component :: proc(entity: Entity, component: Component) {
// //     switch c in component {
// //     case Position:
// //         position_storage[entity] = component.(Position)
// //     case Health:
// //         health_storage[entity] = component.(Health)
// //     }
// // }

// // get_component :: proc(entity: Entity, $T: typeid) -> ^T {
// //     if T == typeid_of(Health) {
// //         return cast(^T)&health_storage[entity]
// //     } else if T == typeid_of(Position) {
// //         return cast(^T)&position_storage[entity]
// //     } else {
// //         fmt.println("unknown type", type_info_of(T))
// //         return nil
// //     }
// // }

// get_entities :: proc {
//     get_entities_1,
//     get_entities_2,
// }


// get_entities_1 :: proc($T: typeid) -> []T {
//     component_id := register_component(T)
//     archetype_id, archetype := register_archetype(component_id)


//     return {}
// }

// get_entities_2 :: proc($T1: typeid, $T2: typeid) -> ([]T1, []T2) {
//     component_id := register_component(T)
//     archetype_id, archetype := register_archetype(component_id)

//     return {}, {}
// }

// system_list: [dynamic]proc() = {}

// Query :: struct {
//     with:    []typeid,
//     without: []typeid,
// }

// register_system :: proc(query: Query, system: proc()) {
//     append(&system_list, system)
// }

// movement_system :: proc() {
//     positions, transform := get_entities(u32, u16)
//     for p in positions {
//         fmt.println(p)
//     }
// }

// // TODO with/without filters

// main :: proc() {
//     x := create_entity()

//     register_component(u32)
//     register_component(f32)

//     a := get_entities(u32)
//     fmt.println(a)
// }
