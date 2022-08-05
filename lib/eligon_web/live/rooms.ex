# defmodule EligonWeb.Rooms do
#   use Phoenix.LiveView
#   use Phoenix.Html

#   alias Eligon.Users

#   def render(assigns) do
#     ~H"""
#     <div class="columens">
#       <div clas="columan is-2">
#       <p class="title is-4">Rooms</p>
#       <hr>
#       <ul class="menu-list">
#         <%= for room <- @rooms do%>
#           <li phx-click="room_id_<%= room.id %>">
#             <%= room_name_tag(@room), room %>
#           </li>
#         <% end %>
#       </ul>
#       </div>
#       <div class="column is-10">
#        <%= render_room(@stcket, @room) %>
#       </div>
#     </div>
#     """
#   end

#   defp room_name_tag(room, room), do: contet_tag(:a, "# #{room.name}", class: "is-active")
#   defp room_name_tag(_, room), do: contet_tag(:a, "# #{room.name}")

#   defp render_room(socket, room) do
#     live_render(socket, EligonWeb.Rooms,
#     id: room.id, #live_renderはidを変更しないと再マウントしない
#     session: %{"room" => room, "current_user" => socket.assigns.current_user})
#   end

#   def mount(_paams, sssion, socket) do
#     {:ok,
#       assign(socket,
#         rooms: Spaces.list_rooms(),
#         room: Spaces.get_room_by(%{roomname: "looby"}),
#         current_user: session["current_user"]
#         )
#       }
#   end

#   def handle_event("room_id" <> id, _params, %{assigns: _assigns} = socket) do
#     {:noreply, assign(socket, room: Space.get_room(String.to_integer(id)))}
#   end
# end
