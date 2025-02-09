package common

import "core:fmt"
import "core:strings"
import en "vendor:ENet"

main :: proc() {
    host := strings.clone_to_cstring("127.0.0.1")
    address := en.Address {
        port = 12345,
    }
    en.address_set_host_ip(&address, host)


    en.initialize()

    client := en.host_create(nil, 1, 2, 0, 0)
    if client == nil {
        fmt.println("error occured while creating a client")
        return
    }

    peer := en.host_connect(client, &address, 2, 0)
    if peer == nil {
        fmt.println("error occured while connecting to a server")
    }

    event := en.Event{}
    if en.host_service(client, &event, 1000) > 0 &&
       event.type == en.EventType.CONNECT {
        fmt.println("connected")
        send_packet(peer, {1, 2, 3})
        en.host_flush(client)
    } else {
        fmt.println("connection to the server failed")
        en.peer_reset(peer)
    }

    en.host_destroy(client)
    en.deinitialize()
}

send_packet :: proc(peer: ^en.Peer, data: []u32) {
    packet := en.packet_create(
        &data[0],
        size_of(u32) * len(data),
        {en.PacketFlag.RELIABLE},
    )
    en.peer_send(peer, 0, packet)
}
