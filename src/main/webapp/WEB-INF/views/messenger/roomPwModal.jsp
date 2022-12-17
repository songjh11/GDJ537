<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
							<!-- 채팅방 비밀번호 입력 폼 -->
							<div id="pwModal" class="pwModal-overlay" style="z-index: 100;">
								<div class="pwModal-window">
									<div class="close-area">X</div>
									<div class="content">
										<div class="pwModalInfo">
											<div class="infoArea" style="background: transparent; border: none; box-shadow: none !important;">
												<div class="input-group mb-3 justify-content-center">
													<div class="form-floating">
														<label for="floatingInputGroup1">채팅방 이름</label>
													  <input type="text" name="roomName" class="form-control" id="floatingInputGroup1" placeholder="방이름을 입력해 주세요">
													</div>
												</div>
												<div class="input-group has-validation mb-3 justify-content-center">
													<div class="form-floating is-invalid">
													  <label for="floatingInputGroup2">비밀번호</label>
													  <input type="password" id="numCheck" name="pw" class="form-control" id="floatingInputGroup2" placeholder="숫자를 입력해 주세요" required>
													  <div class="invalid-feedback">
														Please choose a username.
													  </div>
													</div>
												</div>
												<p class="mt-4">
													<button type="submit" id="roomAddBtn" class="btn" style="background: #4e73df; color: #FFFFFF;">생성</button>
												</p>
											</div>
										</div>
									</div>
								</div>
							</div>