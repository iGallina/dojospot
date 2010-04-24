require 'spec_helper'

describe 'home page' do

	context 'proposed sessions display list' do
	
		it 'should show no-sessions message without proposed sessions' do 
			assigns[:dojo_sessions] = []
			render('/home/index')
			response.should have_tag('p', 'Nenhuma sessão proposta no momento.')
		end

		context 'details' do
	
			before :each do 
				@dojo_session = Factory.create(:dojo_session, :confirmed_users=>[Factory.create(:user)])
				assigns[:dojo_sessions] = [@dojo_session]
			end
	
			it 'should show the next proposed session date and title' do
				render('/home/index')
				
				response.should have_tag('h3', @dojo_session.title)
				response.should include_text(I18n.l(@dojo_session.date, :format=>"pretty"))
				
			end
			
			# TODO: quantidade de confirmados
			# TODO: data apresentada como 'amanhã', 'depois de amanhã', etc.
	
			it 'should present date in brazilian format' do
				render('dojo_sessions/index')
				the_date = I18n.l @dojo_session[:date], :format=>"pretty"
				response.should include_text(the_date)
			end
				
			it 'should not show the no-sessions message' do
				render('dojo_sessions/index')
				response.should_not have_tag('p', 'Nenhuma sessão proposta no momento.')
			end
					
		end
	
		it 'should show the three proposed sessions' do
			assigns[:dojo_sessions] = [Factory.create(:dojo_session), Factory.create(:dojo_session), Factory.create(:dojo_session)]
			render('dojo_sessions/index')
			dojo_sessions = assigns[:dojo_sessions]
			response.should have_tag('div[id=?]', "dojo_session_#{dojo_sessions[0].id}", :text=>/.*#{dojo_sessions[0].title}*/)
			response.should have_tag('div[id=?]', "dojo_session_#{dojo_sessions[1].id}", :text=>/.*#{dojo_sessions[1].title}*/)
			response.should have_tag('div[id=?]', "dojo_session_#{dojo_sessions[2].id}", :text=>/.*#{dojo_sessions[2].title}*/)
		end
	
	
	end
	
end