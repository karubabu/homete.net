Plugin.create(:hometedotnet) do
	DEFINED_TIME = Time.new.freeze
	exptmp = nil
	Plugin.call(:update, nil, [Message.new(:message => "test", :system => true)])
	on_appear do |ms|
		ms.each do |m|
			exptmp = m.message.to_show()
			#TODO:そのツイートした相手が私をフォローしているかを確認する
			if exptmp =~ /ほめてね/ and m[:created] > DEFINED_TIME and !m.retweet? then
				Service.primary.post(:message => "#{"@" + m.user.idname + "えらいっ" + "！"*rand(5)}", :replyto => m)
			end
		end
	end
end