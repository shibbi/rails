# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create!(email: 'a@b.com',
             password_digest: BCrypt::Password.create('ababab'))
User.create!(email: 'b@c.com',
             password_digest: BCrypt::Password.create('bcbcbc'))
User.create!(email: 'm@e.com',
             password_digest: BCrypt::Password.create('mememe'))

rs = Band.create!(name: 'The Rolling Stones')
bsb = Band.create!(name: 'Backstreet Boys')

bab = rs.albums.create!(title: 'Black and Blue', kind: 'studio')
er = rs.albums.create!(title: 'Emotional Rescue', kind: 'studio')
stripped = rs.albums.create!(title: 'Stripped', kind: 'live')
ng = bsb.albums.create!(title: 'Never Gone', kind: 'live')

bab.tracks.create!(title: 'Hot Stuff', kind: 'regular')
bab.tracks.create!(title: 'Hand of Fate', kind: 'regular')
bab.tracks.create!(title: 'Cherry Oh Baby', kind: 'regular')
bab.tracks.create!(title: 'Memory Motel', kind: 'regular')

er.tracks.create!(title: 'Dance (Pt. 1)', kind: 'regular')
er.tracks.create!(title: 'Summer Romance', kind: 'regular')
er.tracks.create!(title: 'Sned It to Me', kind: 'regular')
er.tracks.create!(title: 'Let Me Go', kind: 'regular')
er.tracks.create!(title: 'Indian Girl', kind: 'regular')

stripped.tracks.create!(title: 'Street Fighting Man', kind: 'regular')
stripped.tracks.create!(title: 'Like A Rolling Stone', kind: 'regular')
stripped.tracks.create!(title: 'Not Fade Away', kind: 'regular')
stripped.tracks.create!(title: 'Honest I Do', kind: 'bonus')
stripped.tracks.create!(title: 'All Down the Line', kind: 'bonus')

ng.tracks.create!(title: 'Incomplete', kind: 'regular')
ng.tracks.create!(title: 'Just Want You To Know', kind: 'regular')
cbty = ng.tracks.create!(title: 'Crawling Back To You', kind: 'regular')
ng.tracks.create!(title: 'Weird World', kind: 'regular')
ng.tracks.create!(title: 'I Still...', kind: 'regular')
ng.tracks.create!(title: 'Poster Girl', kind: 'regular')
ng.tracks.create!(title: 'Lose It All', kind: 'regular')
ng.tracks.create!(title: 'Climbing the Walls', kind: 'regular')
ng.tracks.create!(title: 'My Beautiful Woman', kind: 'regular')
ng.tracks.create!(title: 'Safest Place to Hide', kind: 'regular')
ng.tracks.create!(title: 'Siberia', kind: 'regular')
ng.tracks.create!(title: 'Never Gone', kind: 'regular')
ng.tracks.create!(title: 'Song for the Unloved', kind: 'bonus')
ng.tracks.create!(title: 'Rush Over Me', kind: 'bonus')
ng.tracks.create!(title: 'Movin\' On', kind: 'bonus')

cbty.update(lyrics:
"Everybody knows that I was such a fool to ever let go of you
Baby I was wrong
Yeah I know I said we'd be better off alone
It was time that we moved on
I know I broke your heart, I didn't mean to break your heart
But baby here I am

Banging on your front door
My pride spilled on the floor
My hands and knees are bruised and I'm crawling back to you
Begging for a second chance
Are you gonna let me in?
I was running from the truth and now I'm crawling back to you

I know you're in there and you can make me wait
But I'm not goin' away
It's the least that I can do, just to tell you face to face
I was lying to myself, now I'm dying in this hell
Girl I know you're mad, I can't blame you for being mad
But baby here I am

Banging on your front door
My pride spilled on the floor
My hands and knees are bruised and now I'm crawling back to you
Begging for a second chance
Are you gonna let me in?
I was running from the truth and now I'm crawling back to you

If you could see these tears I'm crying
Touch these hands that can't stop shaking
Hear my heart that's barely beating
You will see a different man

But baby here I am
Banging on your front door
My pride spilled on the floor
My hands and knees are bruised and I'm crawling back to you (come on)
Begging for a second chance
Are you gonna let me in? (let me in)
I was running from the truth, now I'm crawling back to you

Banging on your front door (darling)
My pride spilled on the floor
I was running from the truth, now I'm crawling back to you, yeah
Now I'm crawling back to you
Crawling back to you
Crawling back to you
Crawling back to you")
