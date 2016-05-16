module Qblox
  class Dialog < Qblox::Base
    attr_accessor(:_id, :accessible_for_ids, :created_at, :last_message,
                  :last_message_date_sent, :last_message_user_id, :name,
                  :occupants_ids, :photo, :type, :updated_at, :user_id,
                  :xmpp_room_jid, :unread_messages_count)
    alias :id :_id

    class Collection < Array
      attr_accessor(:total_entries, :skip, :limit, :items)

      def initialize(attrs)
        self.total_entries = attrs['total_entries']
        self.skip = attrs['skip']
        self.limit = attrs['limit']
        self.items = attrs['items']
        items.each do |item|
          push(Qblox::Dialog.new(item))
        end
      end
    end
  end
end
