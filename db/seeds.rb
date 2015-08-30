b1 = Blog.create!(author: 'Blaine Hatab', title: 'Test blog - text only', content: "This is a quick introduction to show you how to setup react native. Quick note, I had to restart my computer after installing watchman for it to work. I'm not 100% sure why, but it worked after restarting my computer. \r\n\r\n### Install libraries\r\n\r\n```\r\nbrew install node\r\n\r\nbrew install watchman\r\n\r\nnpm install -g react-native-cli\r\n```\r\n\r\n### Create and start project\r\n\r\n```\r\nreact-native init ExampleReactNative\r\n\r\ncd ExampleReactNative\r\n\r\nnpm start\r\n```\r\n\r\n### Launch IOS simulator\r\nLaunch Xcode, open up the project you just created, and run the project. You should see an IOS simulator pop up and now you can see the app you just created. Xcode is simply there to run the simulator and you aren't going to be using it to edit any code. Use a standard IDE or text editor to change the code. Press CMD+R on the IOS simulator to see your changes take place.\r\n\r\nNow you're ready to make phone apps!\r\n\r\n### Links\r\nReact Native: http://facebook.github.io/react-native/\r\n\r\nReact: http://facebook.github.io/react/")

b2 = Blog.create!(author: 'Ken Miyamoto', title: 'Second test blog with text only', content: 'Dictumst porta in dapibus? Vut, tortor! Et? Et, est lundium ultrices et? Sagittis purus vut nunc. Elit in massa nisi enim penatibus ac auctor sociis non vut porta, nec integer tincidunt quis risus vut, mid, sit, integer augue platea diam, eu sit cras cras turpis, et vel vel vel montes amet ridiculus, sit tortor, enim sed. Magna diam parturient, pellentesque, hac platea penatibus augue? Purus tempor dis sociis, facilisis mauris, pulvinar enim, et tortor platea? Mattis auctor, cras! Augue magnis scelerisque dictumst, augue porta. Lorem tempor et est! Mid habitasse habitasse elementum vel duis pid odio, integer magnis? Placerat. Augue mid augue, nec ultricies elementum turpis nascetur facilisis, placerat! Ut magnis rhoncus! Velit purus vel, auctor ultricies habitasse ultrices velit. Et dictumst phasellus? Ut phasellus, arcu porttitor urna tempor mid et, ut. Ut pid tincidunt sed in, placerat integer nisi sed habitasse sagittis, platea parturient lectus lorem, ac aenean! Nisi habitasse, integer, augue lectus ac, sociis arcu augue, elementum hac augue cursus enim urna? Nascetur dapibus augue? Rhoncus, nunc. Turpis duis porta, pellentesque, penatibus placerat? Integer sagittis risus quis, amet cras velit porttitor risus, magnis nisi mattis massa, turpis? Et auctor, ac dignissim vut. Eros et natoque. Urna porta. Pellentesque dis montes eros massa purus integer risus, magna etiam lundium pid elementum pulvinar mus lectus, quis scelerisque montes! Augue, augue sed sociis in aliquet, adipiscing turpis magna sit amet. Nec dictumst natoque hac, porta amet et? Auctor sit pulvinar. Ac dolor rhoncus quis! Rhoncus non augue, non elementum turpis pulvinar, integer, adipiscing vel, tincidunt proin elit sed eros mid! Auctor quis pulvinar augue amet natoque in sed elementum, augue pellentesque elit proin adipiscing elementum turpis a proin pulvinar! Et rhoncus auctor elementum massa elementum urna habitasse a tortor cursus integer tempor tristique. Tortor duis integer? Integer tristique nisi, tristique proin platea, ac velit cras, in proin amet diam! Pid tortor! Et enim magnis, in. Non proin nec nunc? Magna tincidunt. Dis odio est sagittis tristique auctor et purus aenean porta augue nascetur nisi lundium lectus lorem? Purus elementum penatibus purus, purus lectus. Ultricies! Rhoncus mus auctor turpis turpis! In aenean risus turpis mattis cum magna ac dis ac. Duis! Elementum rhoncus, pid aliquam nunc ultricies, ultrices cursus tristique, aenean elit dictumst in elementum mus quis, porttitor magna vel, vel! Massa eros enim placerat. Nisi ac sagittis, ac amet ac nisi mauris, magna penatibus nascetur, in porttitor habitasse dis, et urna montes! Augue urna. Odio etiam? In! Dis ut arcu. Tincidunt nisi! Hac augue phasellus placerat, sociis urna arcu, egestas porttitor purus sed aliquet, sed ridiculus nunc. Tempor in dapibus, pulvinar lundium amet! Pulvinar, ac turpis cursus sit, scelerisque mid porttitor! Et, urna lundium augue augue sed elementum! Auctor? Pulvinar, augue elementum odio lectus pulvinar tincidunt facilisis, augue a diam tempor turpis aenean nisi sed mauris. Massa augue? Placerat et tristique, ut mid nascetur platea, turpis sagittis dignissim. Adipiscing mus? Ultricies porta egestas turpis cum? In nisi aliquet platea ut placerat risus nunc diam turpis, porttitor dolor, a mid pulvinar dolor! Sit sagittis penatibus vel et sit tincidunt tincidunt pulvinar odio eu sed auctor et tortor mus. Enim lectus, ultricies magna vut, porta scelerisque penatibus. Lorem sagittis penatibus ac! Et magna, lorem auctor auctor magna a adipiscing, nascetur urna, risus eros adipiscing hac, adipiscing integer lectus ac augue! Amet est lundium tempor, tortor, aliquam augue in arcu. Eu egestas risus, ut egestas augue placerat aliquet rhoncus diam! Dolor a penatibus risus pid, ac, nisi tortor tincidunt elit, auctor a adipiscing tincidunt ut. Porttitor magna amet odio ridiculus, mus, scelerisque? Ultrices! Eros lacus tristique mauris magna, turpis mauris. ')

b3 = Blog.create!(author: 'Blaine Hatab', title: 'Video blog', embed_id: 'MGsalg2f9js')

b4 = Blog.create!(author: 'Ken Miyamoto', title: 'Video blog with content', embed_id: 'MGsalg2f9js', content: "This is a quick introduction to show you how to setup react native. Quick note, I had to restart my computer after installing watchman for it to work. I'm not 100% sure why, but it worked after restarting my computer. \r\n\r\n### Install libraries\r\n\r\n```\r\nbrew install node\r\n\r\nbrew install watchman\r\n\r\nnpm install -g react-native-cli\r\n```\r\n\r\n### Create and start project\r\n\r\n```\r\nreact-native init ExampleReactNative\r\n\r\ncd ExampleReactNative\r\n\r\nnpm start\r\n```\r\n\r\n### Launch IOS simulator\r\nLaunch Xcode, open up the project you just created, and run the project. You should see an IOS simulator pop up and now you can see the app you just created. Xcode is simply there to run the simulator and you aren't going to be using it to edit any code. Use a standard IDE or text editor to change the code. Press CMD+R on the IOS simulator to see your changes take place.\r\n\r\nNow you're ready to make phone apps!\r\n\r\n### Links\r\nReact Native: http://facebook.github.io/react-native/\r\n\r\nReact: http://facebook.github.io/react/")

t1 = Tag.create!(name: 'screencast')
t2 = Tag.create!(name: 'rails')
t3 = Tag.create!(name: 'ruby')
t4 = Tag.create!(name: 'HTML')
t5 = Tag.create!(name: 'CSS')
t6 = Tag.create!(name: 'vlog')

b1.tags << t3
b1.tags << t2

b2.tags << t4
b2.tags << t5

b3.tags << t1
b3.tags << t2
b3.tags << t3
b3.tags << t6


b4.tags << t1
b4.tags << t2
b4.tags << t4
b4.tags << t5
b4.tags << t6


user1 = User.new(email: 'greg@greg.com', first_name: 'greg', last_name: 'guy', password: 'asdfasdf', password_confirmation: 'asdfasdf')
user2 = User.new(email: 'steve@steve.com', first_name: 'steve', last_name: 'guy', password: 'asdfasdf', password_confirmation: 'asdfasdf')
user3 = User.new(email: 'jj@jj.com', first_name: 'jj', last_name: 'guy', password: 'asdfasdf', password_confirmation: 'asdfasdf')

user1.skip_confirmation!
user2.skip_confirmation!
user3.skip_confirmation!

user1.save!
user2.save!
user3.save!

p1 = Project.create!(name: 'Music Festival Nation',
                     user: user1,
                     category: :product,
                     status: :active,
                     is_public: true,
                     description: 'Music Festival Nation is striving to be your one stop shop for anything and everything music festival related. Find rides, get up to date information, and more!')

p2 = Project.create!(name: 'Find Me in the Clouds',
                     user: user2,
                     category: :contract,
                     status: :completed,
                     is_public: true,
                     description: 'Mandy Grotie loves to create art that explodes with color! Experience the funky style and passion behind her work.')

p3 = Project.create!(name: 'Hamilton House Education Consulting',
                     user: user3,
                     category: :contract,
                     status: :completed,
                     is_public: true,
                     description: 'We made a website for this group that helps Chinese studnets get into American and UK universites.')

p4 = Project.create!(name: 'Festy Box',
                     user: user1,
                     category: :product,
                     status: :active,
                     is_public: true,
                     description: 'Monthly subscription box for festival related goods.')

p5 = Project.create!(name: 'Pin Squad',
                     user: user2,
                     category: :product,
                     status: :active,
                     is_public: false,
                     description: 'Pin Squad makes custom pins for companies and artists.')

idea1 = Idea.create(name: 'Video Application',
                    description: 'Employers can use this service to create a webpage that applicants can go to. The employers create a list of questions that the applicants answer with video.',
                    user: user1)

idea2 = Idea.create(name: 'Coding Quizes',
                    description: 'Coders can create quizes relating to a programming topic and other coders vote on them.',
                    user: user1)

idea3 = Idea.create(name: 'Mentorship platform',
                    description: 'Mentors can create paths with various types of educational resources for students to follow. The students can interact with the mentors.',
                    user: user2)

idea4 = Idea.create(name: 'Glow in the dark fly strips',
                    description: 'Disposable glow in the dark fly strips. They would attract bugs better.',
                    user: user3)



