package com.ezXpense.frontend.user.dto;
public class ChangePasswordDto {
		
		private String newPassword;
		
		private String confirmPassword;
		
		private String currentPassword;
		

		public String getNewPassword() {
			return newPassword;
		}

		public void setNewPassword(String newPassword) {
			this.newPassword = newPassword;
		}

		public String getConfirmPassword() {
			return confirmPassword;
		}

		public void setConfirmPassword(String confirmPassword) {
			this.confirmPassword = confirmPassword;
		}

		public String getCurrentPassword() {
			return currentPassword;
		}

		public void setCurrentPassword(String currentPassword) {
			this.currentPassword = currentPassword;
		}

		

}

