package server

import "core:fmt"
import en "vendor:ENet"

main :: proc() {
    address := en.Address{en.HOST_ANY, 12345}
    fmt.println("hello, im server")

    en.initialize()

    server := en.host_create(&address, 32, 2, 0, 0)
    if server == nil {
        fmt.printfln("error occured while creating a server")
        return
    }

    event := en.Event{}
    for true {
        for en.host_service(server, &event, 0) > 0 {
            switch event.type {
            case .CONNECT:
                fmt.printf(
                    "A new client connected from %x:%u.\n",
                    event.peer.address.host,
                    event.peer.address.port,
                )
            case .DISCONNECT:
                fmt.printf("%s disconnected.\n", event.peer.data)
                event.peer.data = nil
            case .RECEIVE:
                fmt.printf(
                    "A packet of length %u containing %s was received from %s on channel %u.\n",
                    event.packet.dataLength,
                    event.packet.data,
                    event.peer.data,
                    event.channelID,
                )
                en.packet_destroy(event.packet)
            case .NONE:
            }
        }
    }
    fmt.println("stopping server")

    en.host_destroy(server)
    en.deinitialize()
}
