import SwiftUI

struct HomeView: View {
    @State private var showingAlert = false
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                headerView
                featuresView
                actionButtonsView
            }
            .padding()
        }
        .navigationTitle("Home")
        .alert("Feature Coming Soon", isPresented: $showingAlert) {
            Button("OK") { }
        } message: {
            Text("This feature will be available in a future update.")
        }
    }
    
    private var headerView: some View {
        VStack(spacing: 16) {
            Image(systemName: "house.fill")
                .font(.system(size: 60))
                .foregroundColor(.blue)
            
            Text("Home Dashboard")
                .font(.title)
                .fontWeight(.bold)
            
            Text("Welcome to your personalized dashboard")
                .font(.subheadline)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
        }
        .padding()
        .background(Color.gray.opacity(0.1))
        .cornerRadius(12)
    }
    
    private var featuresView: some View {
        LazyVGrid(columns: [
            GridItem(.flexible()),
            GridItem(.flexible())
        ], spacing: 16) {
            FeatureCard(
                icon: "gear",
                title: "Settings",
                description: "Configure app preferences"
            ) {
                showingAlert = true
            }
            
            FeatureCard(
                icon: "person.circle",
                title: "Profile",
                description: "Manage your profile"
            ) {
                showingAlert = true
            }
            
            FeatureCard(
                icon: "chart.bar",
                title: "Analytics",
                description: "View your statistics"
            ) {
                showingAlert = true
            }
            
            FeatureCard(
                icon: "bell",
                title: "Notifications",
                description: "Manage notifications"
            ) {
                showingAlert = true
            }
        }
    }
    
    private var actionButtonsView: some View {
        VStack(spacing: 12) {
            Button("Primary Action") {
                showingAlert = true
            }
            .buttonStyle(.borderedProminent)
            
            Button("Secondary Action") {
                showingAlert = true
            }
            .buttonStyle(.bordered)
        }
        .padding(.top)
    }
}

struct FeatureCard: View {
    let icon: String
    let title: String
    let description: String
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            VStack(spacing: 8) {
                Image(systemName: icon)
                    .font(.system(size: 30))
                    .foregroundColor(.blue)
                
                Text(title)
                    .font(.headline)
                    .fontWeight(.semibold)
                
                Text(description)
                    .font(.caption)
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.center)
            }
            .padding()
            .frame(height: 120)
            .frame(maxWidth: .infinity)
            .background(Color.gray.opacity(0.05))
            .cornerRadius(10)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.gray.opacity(0.2), lineWidth: 1)
            )
        }
        .buttonStyle(.plain)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            HomeView()
        }
    }
}