import SwiftUI

struct LessonView: View {
    
    @State var lessons1 = [Lesson1]()
    var dataServiceLesson1 = Lesson1ViewDataService()
    @State var lessons2 = [Lesson2]()
    var dataServiceLesson2 = Lesson2ViewDataService()
    @State var lessons3 = [Lesson3]()
    var dataServiceLesson3 = Lesson3ViewDataService()
    @State var lessons4 = [Lesson4]()
    var dataServiceLesson4 = Lesson4ViewDataService()
    @State var lessons5 = [Lesson5]()
    var dataServiceLesson5 = Lesson5ViewDataService()
    
    var body: some View {
        NavigationStack {

            ScrollView(showsIndicators: false) {
                VStack(spacing: 10) {
                    ForEach(lessons1) { lesson in
                        NavigationLink {
                            Lesson1DetailView(lesson1: lesson)
                            // hier soll die DetailView hinkommen
                        } label: {
                            Card1View(lesson1: lesson)
                                .padding(.bottom, 10)
                        }
                        
                    }
                    
                    ForEach(lessons2) { lesson in
                        NavigationLink {
                            Lesson2DetailView(lesson2: lesson)
                            // hier soll die DetailView hinkommen
                        } label: {
                            Card2View(lesson2: lesson)
                                .padding(.bottom, 10)
                        }
                        
                    }
                    
                    ForEach(lessons3) { lesson in
                        NavigationLink {
                            Lesson3DetailView(lesson3: lesson)
                            // hier soll die DetailView hinkommen
                        } label: {
                            Card3View(lesson3: lesson)
                                .padding(.bottom, 10)
                        }
                        
                    }
                    
                    ForEach(lessons4) { lesson in
                        NavigationLink {
                            Lesson4DetailView(lesson4: lesson)
                            // hier soll die DetailView hinkommen
                        } label: {
                            Card4View(lesson4: lesson)
                                .padding(.bottom, 10)
                        }
                        
                    }
                    
                    ForEach(lessons5) { lesson in
                        NavigationLink {
                            Lesson5DetailView(lesson5: lesson)
                            // hier soll die DetailView hinkommen
                        } label: {
                            Card5View(lesson5: lesson)
                                .padding(.bottom, 10)
                        }
                        
                    }
                    
                }
                .padding()
            }
            .navigationTitle("Kurse")
            .navigationBarTitleDisplayMode(.large)
            
            .onAppear {
                lessons1 = dataServiceLesson1.getLesson1Data()
            }
            .onAppear {
                lessons2 = dataServiceLesson2.getLesson2Data()
            }
            .onAppear {
                lessons3 = dataServiceLesson3.getLesson3Data()
            }
            .onAppear {
                lessons4 = dataServiceLesson4.getLesson4Data()
            }
            .onAppear {
                lessons5 = dataServiceLesson5.getLesson5Data()
            }
        }
        .navigationBarHidden(false)
        
    }
}

#Preview {
    LessonView()
}
