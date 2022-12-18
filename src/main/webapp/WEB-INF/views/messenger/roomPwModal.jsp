<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
							<!-- 채팅방 비밀번호 입력 폼 -->
							<form action="./roomPw">
								<div id="pwModal" class="pwModal-overlay" style="z-index: 100;">
									<div class="pwModal-window">
										<div class="close-area">X</div>
										<div class="content">
											<div class="pwModalInfo">
												<div class="infoArea" style="background: transparent; border: none; box-shadow: none !important;">
													<div class="input-group mb-3 justify-content-center">
														<div class="form-floating">
															<label for="floatingInputGroup1">${roomVO.roomName}</label>
														</div>
													</div>
													<div class="input-group has-validation mb-3 justify-content-center">
														<div class="form-floating is-invalid">
														  <label for="floatingInputGroup2">비밀번호</label>
														  <input type="password" id="roomPwCheck" name="pw" class="form-control" id="floatingInputGroup2" placeholder="숫자를 입력해 주세요" required>
														  <div class="invalid-feedback">
															Please choose a username.
														  </div>
														</div>
													</div>
													<p class="mt-4">
														<button type="button" id="pwCheckBtn" class="btn" style="background: #4e73df; color: #FFFFFF;">확인</button>
													</p>
												</div>
											</div>
										</div>
									</div>
								</div>
							</form>